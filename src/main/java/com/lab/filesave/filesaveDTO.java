package com.lab.filesave;


public class filesaveDTO {
	private String id;
	private String name;
	private String imagsize;
	private String savetime;
	private String savename;
	private String filetitle;
	
	
	
	public String getFiletitle() {
		return filetitle;
	}
	public void setFiletitle(String filetitle) {
		this.filetitle = filetitle;
	}
	public String getSavename() {
		return savename;
	}
	public void setSavename(String savename) {
		this.savename = savename;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImagsize() {
		return imagsize;
	}
	public void setImagsize(String imagsize) {
		this.imagsize = imagsize;
	}
	public String getSavetime() {
		return savetime;
	}
	public void setSavetime(String savetime) {
		this.savetime = savetime;
	}
}
