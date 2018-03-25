package com.social.web;

import com.social.enums.PictureType;
import com.social.model.Picture;
import com.social.service.SecurityService;
import com.social.service.UserService;
import org.apache.catalina.core.ApplicationPart;
import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigInteger;
import java.nio.file.*;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;


@MultipartConfig
@Controller
public class UploadController{

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserService userService;

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
            String subfolder = "public";
            PictureType type;
            String userName = securityService.findLoggedInUsername();
            if (userName != null) {
                Path uploadDir;
                Path uploadedFile;
                Path rootDir = FileSystems.getDefault().getRootDirectories().iterator().next();
                Collection<Part> parts = request.getParts();
                String result = ((ApplicationPart) parts.stream().filter(a -> a.getName().equals("img_type")).findFirst().orElseGet(() -> parts.iterator().next())).getString("UTF-8");
                if (result != null && result.equals("avatar")) {
                    subfolder = "avatar";
                } else if (result != null && result.equals("private")) {
                    subfolder = "private";
                }
                Part filePart = parts.stream().filter(a -> a.getSubmittedFileName() != null).findFirst().orElseGet(() -> parts.iterator().next());
                if (filePart != null && filePart.getSubmittedFileName() != null) {
                    type = getType(filePart.getSubmittedFileName());
                    if (type != null) {
                        fileName = new BigInteger(130, new SecureRandom()).toString(32) +
                                parseFileFormat(filePart.getSubmittedFileName());
                    }
                    uploadDir = Paths.get(rootDir.toString(), "upload", userName, subfolder);
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

    @GetMapping(value = "/preview/{type}")
    public void previewFiles(@PathVariable("type") String type, HttpServletResponse response) {
        Path rootDir = FileSystems.getDefault().getRootDirectories().iterator().next();
        String userName = securityService.findLoggedInUsername();
        String subfolder = "public";
        if (type != null && type.equals("avatar")) {
            subfolder = "avatar";
        } else if (type != null && type.equals("private")) {
            subfolder = "private";
        }
        Path uploadDir = Paths.get(rootDir.toString(), "upload", userName, subfolder);
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