package com.poly.service;

import java.io.File;
import java.io.IOException;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
@Service
public class imgservice {
	@Autowired
    private HttpServletRequest request;
	
	public File save(MultipartFile file, String folderName) {
        if (!file.isEmpty()) {
            try {
                String webRootPath = request.getServletContext().getRealPath("/");
                String folderPath = webRootPath + folderName;
                File uploadDir = new File(folderPath);

                // Check if the folder already exists, create it if not
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                String originalFileName = file.getOriginalFilename();
                String fileName = originalFileName;
                File destination = new File(uploadDir, fileName);

                file.transferTo(destination);
                System.out.println(destination);
                return destination;
            } catch (IOException e) {
                throw new RuntimeException("Error saving file");
            }
        }
        return null;
    }
}
