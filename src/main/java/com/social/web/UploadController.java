package com.social.web;


import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.apache.tomcat.util.http.fileupload.FileUpload;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Collection;
import java.util.List;


@MultipartConfig
@Controller
public class UploadController{

    @GetMapping("/upload")
    public String fileUploadForm(Model model) {
        return "fileUploadForm";
    }

    // Handling file upload request
    @PostMapping("/upload")
    public void fileUpload(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                String fileName;
                String filePath;
                Type type;
                File uploadDir = new File("c:/upload");
                if (!uploadDir.exists()) uploadDir.mkdirs();
                byte[] buffer = new byte[8 * 1024];
                Collection<Part> parts = request.getParts();
                for (Part part : parts) {
                    File uploadedFile = new File(uploadDir, part.getName());

                    InputStream input = part.getInputStream();
                    try {
                        OutputStream output = new FileOutputStream(uploadedFile);
                        try {
                            int bytesRead;
                            while ((bytesRead = input.read(buffer)) != -1) {
                                output.write(buffer, 0, bytesRead);
                            }
                        } finally {
                            output.close();
                        }
                    } finally {
                        input.close();
                    }
                    response.setContentType("application/json");
                    PrintWriter out = response.getWriter();
                    JSONObject json=new JSONObject();
                    json.put("","");
                    out.print(json);
                    out.close();
                }
            }
            finally {

            }
        }
    }
    enum Type {

        IMAGES("/upload/images", ".jpg", ".bmp", ".gif", ".png", ".jpeg"),
        VIDEOS("/upload/videos", ".avi", ".mpeg", ".mpg", ".mp4", ".mov", ".mkv", ".flv"),
        MUSICS("/upload/musics", ".mp3", ".wav");

        private String path;
        private String[] formats;

        Type(String path, String... format) {
            this.path = path;
            this.formats = format;
        }

        public String[] getFormats() {
            return formats;
        }

        public String getPath() {
            return path;
        }
    }

    private static String parseFileFormat(String fileName) {
        fileName = fileName.toLowerCase();
        int dotPosition = fileName.lastIndexOf(".");
        String format = fileName.substring(dotPosition, fileName.length());
        return format;
    }

    private Type getType(String fileName) {
        String format = parseFileFormat(fileName);
        Type[] values = Type.values();
        for (int i = 0; i < values.length; i++) {
            for (int j = 0; j < values[i].getFormats().length; j++) {
                if (values[i] == Type.IMAGES && values[i].getFormats()[j].equals(format)) {
                    return Type.IMAGES;
                } else if (values[i] == Type.VIDEOS && values[i].getFormats()[j].equals(format)) {
                    return Type.VIDEOS;
                } else if (values[i] == Type.MUSICS && values[i].getFormats()[j].equals(format)) {
                    return Type.MUSICS;
                }
            }
        }
        return null;
    }
}