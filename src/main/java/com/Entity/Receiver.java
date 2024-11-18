package com.Entity;

import java.util.Date;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;

import jakarta.persistence.Table;

@Entity
@Table(name="receiver")
public class Receiver {
	@Column(name="name")
	private String name;
	@Id
	@Column(name="cnic")
	private String cnic;
	@Column(name="contact")
	private String contact;
	@Column(name="totalunitsdemand")
	private int units;
	@CreationTimestamp
	@Column(name="receivedate")
	private Date receivedate;
	@Column(name="dateofbirth")
	private String date;
	@Column(name="gender")
	private String gender;
	@Column(name="bloodgroup")
	private String bloodgroup;
	private Integer unitsreceived;
	

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
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public int getUnits() {
		return units;
	}
	public void setUnits(int units) {
		this.units = units;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBloodgroup() {
		return bloodgroup;
	}
	public void setBloodgroup(String bloodgroup) {
		this.bloodgroup = bloodgroup;
	}

	public Date getReceivedate() {
		return receivedate;
	}
	public void setReceivedate(Date receivedate) {
		this.receivedate = receivedate;
	}
	public Integer getUnitsreceived() {
		return unitsreceived;
	}
	public void setUnitsreceived(Integer unitsreceived) {
		this.unitsreceived = unitsreceived;
	}
	@Override
	public String toString() {
		return "Receiver [name=" + name + ", cnic=" + cnic + ", contact=" + contact + ", units=" + units
				+ ", receivedate=" + receivedate + ", date=" + date + ", gender=" + gender + ", bloodgroup="
				+ bloodgroup + ", unitsreceived=" + unitsreceived + "]";
	}
	
	

}
