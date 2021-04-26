package com.web.toosome.admin.mainManagement.vo;

import java.util.Date;

import lombok.Data;

@Data
public class VisitorVO {

	private int visitId;
    private Date visitTime;
    private String visitIp;
    
}
