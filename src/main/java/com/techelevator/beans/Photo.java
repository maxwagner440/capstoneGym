package com.techelevator.beans;

import java.util.Date;

import javax.persistence.*;

import com.cloudinary.StoredFile;

//@Entity(name = "photos")
public class Photo {
    //@GeneratedValue(strategy = GenerationType.AUTO)
    private Long imageId;

    private String imageTitle;

    private String image;

    private Date creationDate = new Date();

    public Long getImageId() {
        return imageId;
    }

    public void setImageId(Long imageId) {
        this.imageId = imageId;
    }

    public String getImageTitle() {
        return imageTitle;
    }

    public void setImageTitle(String imageTitle) {
        this.imageTitle = imageTitle;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate =  creationDate;
    }

    public StoredFile getUpload() {
        StoredFile file = new StoredFile();
        file.setPreloadedFile(image);
        return file;
    }

    public void setUpload(StoredFile file) {
        this.image = file.getPreloadedFile();
    }

}

