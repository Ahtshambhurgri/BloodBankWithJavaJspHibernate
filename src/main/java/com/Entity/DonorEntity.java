package com.Entity;


import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import jakarta.persistence.Table;

@Entity
@Table(name="donor")
public class DonorEntity {
	@Column(name="donorname")
	private String name;
	@Id
	private String cnic;
	@Column(name="cotactnumber")
	private String contactnumber;
	@Column(name="datefobirth")
	private String dateOfBirth;
	@Column(name="unitsdonated")
	private int units;
	@Column(name="gender")
	private String gender;
	@Column(name="bloodtype")
	private String bloodtype;
	@CreationTimestamp
	@Column(name="donatedate")
	private Date donateDate;

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCnic() {
		return cnic;
	}
	public void setCnic(String cnic) {
		this.cnic = cnic;
	}
	public String getContactnumber() {
		return contactnumber;
	}
	public void setContactnumber(String contactnumber) {
		this.contactnumber = contactnumber;
	}
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	public int getUnits() {
		return units;
	}
	public void setUnits(int units) {
		this.units = units;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBloodtype() {
		return bloodtype;
	}
	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}
	public Date getDonateDate() {
		return donateDate;
	}
	public void setReceivDate(Date donateDate) {
		this.donateDate = donateDate;
	}
	@Override
	public String toString() {
		return "DonorEntity [name=" + name + ", cnic=" + cnic + ", contactnumber=" + contactnumber + ", dateOfBirth="
				+ dateOfBirth + ", units=" + units + ", gender=" + gender + ", bloodtype=" + bloodtype + ", donateDate="
				+ donateDate + "]";
	}
	
	
}