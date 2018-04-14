package com.social.web;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.social.enums.PictureKind;
import com.social.enums.PictureType;
import com.social.model.Picture;
import com.social.service.SecurityService;
import com.social.service.UserService;
import org.apache.catalina.core.ApplicationPart;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.hibernate.jpa.internal.EntityManagerFactoryImpl;
import org.hibernate.jpa.internal.EntityManagerImpl;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.provider.HibernateUtils;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigInteger;
import java.nio.file.*;
import java.security.SecureRandom;
import java.util.*;


@MultipartConfig
@Controller
public class UploadController{

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserService userService;

    @PersistenceContext
    private EntityManager em;

    @GetMapping("/upload")
    public String fileUploadForm(Model model) {
        return "fileUploadForm";
    }

    // Handling file upload request
    @PostMapping("/upload")
    public void fileUpload(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (ServletFileUpload.isMultipartContent(request)) {
            String fileName = null;
            PictureKind pKind = PictureKind.PUBLIC;
            PictureType type;
            String userName = securityService.findLoggedInUsername();
            if (userName != null) {
                Path uploadDir;
                Path uploadedFile;
                Path rootDir = FileSystems.getDefault().getRootDirectories().iterator().next();
                Collection<Part> parts = request.getParts();
                String result = ((ApplicationPart) parts.stream().filter(a -> a.getName().equals("img_type")).findFirst().orElseGet(() -> parts.iterator().next())).getString("UTF-8");
                if (result != null && result.equals("avatar")) {
                    pKind = PictureKind.AVATAR;
                } else if (result != null && result.equals("private")) {
                    pKind = PictureKind.PRIVATE;
                }
                Part filePart = parts.stream().filter(a -> a.getSubmittedFileName() != null).findFirst().orElseGet(() -> parts.iterator().next());
                if (filePart != null && filePart.getSubmittedFileName() != null) {
                    type = getType(filePart.getSubmittedFileName());
                    if (type != null) {
                        fileName = new BigInteger(130, new SecureRandom()).toString(32) +
                                parseFileFormat(filePart.getSubmittedFileName());
                    }
                    uploadDir = Paths.get(rootDir.toString(), "upload", userName);
                    Files.createDirectories(uploadDir);
                    uploadedFile = Paths.get(uploadDir.toString(), fileName);
                    try (InputStream input = filePart.getInputStream();
                         OutputStream output = new FileOutputStream(uploadedFile.toFile())) {
                        FileCopyUtils.copy(input, output);
                    }
                    Picture picture = new Picture();
                    picture.setPicturePath(uploadedFile.toAbsolutePath().toString());
                    picture.setType(type);
                    picture.setUser(userService.findByUsername(userName));
                    picture.setPictureKind(pKind);
                    userService.save(picture);
                }
            }
        }
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        JSONObject json=new JSONObject();
        json.put("","");
        out.print(json);
        out.close();
    }

    @PostMapping(value = "/removeFile/{fn}")
    public void removeFile(@PathVariable("fn") String fileName, Model model) {
       int a=0;
    }

    @RequestMapping(value = {"/myPicturesList/{criteria}"})
    public void listBooks(@PathVariable("criteria") String criteria, HttpServletResponse response) {
        PictureKind kind = null;
        Query query;
        if(criteria.equalsIgnoreCase("avatar")){
            kind = PictureKind.AVATAR;
        }else if(criteria.equalsIgnoreCase("public")){
            kind = PictureKind.PUBLIC;
        }else if(criteria.equalsIgnoreCase("private")){
            kind = PictureKind.PRIVATE;
        }
        if(kind==null){
            query= em.createQuery("SELECT pics FROM Picture pics Join pics.user u WHERE u.username=:username");
        }else {
            query = em.createQuery("SELECT pics FROM Picture pics Join pics.user u WHERE u.username=:username and pics.pictureKind=:kind");
        }
        String userName = securityService.findLoggedInUsername();
        query.setParameter("username",userName);
        List<Picture> result = query.getResultList();
        Map resMap = new HashMap();
        for(Picture pic : result){
            resMap.put("pKind",pic.getPictureKind());
            resMap.put("pPath",pic.getPicturePath().replace("C:\\upload",""));
        }
        JSONObject jsonObject = new JSONObject(resMap);
        try {
            response.getWriter().print(jsonObject);
        } catch (IOException e) {
            e.printStackTrace();
        }
        response.setContentType("application/json");
    }

    @GetMapping(value = "/preview/{path}")
    public void previewFiles(@PathVariable("path") String path, HttpServletResponse response) {
        Path rootDir = FileSystems.getDefault().getRootDirectories().iterator().next();
        String userName = securityService.findLoggedInUsername();
        //check permissions for private pics
        Path uploadDir = Paths.get(rootDir.toString(), "upload", path);
        Path file;
        InputStream inputStream = null;
        try (DirectoryStream<Path> stream = Files.newDirectoryStream(uploadDir)) {
            for (Path currentFile: stream) {
                file=currentFile;
                inputStream = Files.newInputStream(file);
                IOUtils.copy(inputStream, response.getOutputStream());
            }
        } catch (IOException | DirectoryIteratorException x) {
            x.printStackTrace();
        }
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        try {
            IOUtils.copy(inputStream, response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static String parseFileFormat(String fileName) {
        fileName = fileName.toLowerCase();
        int dotPosition = fileName.lastIndexOf(".");
        String format = fileName.substring(dotPosition, fileName.length());
        return format;
    }

    private PictureType getType(String fileName) {
        String format = parseFileFormat(fileName);
        PictureType[] values = PictureType.values();
        for (int i = 0; i < values.length; i++) {
            for (int j = 0; j < values[i].getFormats().length; j++) {
                if (values[i] == PictureType.IMAGES && values[i].getFormats()[j].equals(format)) {
                    return PictureType.IMAGES;
                } else if (values[i] == PictureType.VIDEOS && values[i].getFormats()[j].equals(format)) {
                    return PictureType.VIDEOS;
                } else if (values[i] == PictureType.MUSICS && values[i].getFormats()[j].equals(format)) {
                    return PictureType.MUSICS;
                }
            }
        }
        return null;
    }
}