package com.social.web;

import com.social.enums.PictureType;
import com.social.service.SecurityService;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Collection;


@MultipartConfig
@Controller
public class UploadController{

    @Autowired
    private SecurityService securityService;

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
                String filePath;
                PictureType type;
                String userName = securityService.findLoggedInUsername();
                request.getContextPath();
                File uploadDir = new File("c:/upload");
                if (!uploadDir.exists()) uploadDir.mkdirs();
                Collection<Part> parts = request.getParts();
                for (Part part : parts) {
                    if(part.getSubmittedFileName()!=null) {
                        type = getType(part.getSubmittedFileName());
                        if (type != null) {
                            fileName = new BigInteger(130, new SecureRandom()).toString(32) +
                                    parseFileFormat(part.getSubmittedFileName());
                        }
                        File uploadedFile = new File(uploadDir, fileName);
                        try (InputStream input = part.getInputStream();
                             OutputStream output = new FileOutputStream(uploadedFile)) {
                            FileCopyUtils.copy(input, output);
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