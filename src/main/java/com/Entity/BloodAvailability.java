package com.Entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="bloodavailability")
public class BloodAvailability {
	@Id
	@Column(name="bloodtype")
	private String bloodtype;
	@Column(name="unitsavailable")
	private Integer units;
	public String getBloodtype() {
		return bloodtype;
	}
	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}
	public Integer getUnits() {
		return units;
	}
	public void setUnits(Integer units) {
		this.units = units;
	}
	@Override
	public String toString() {
		return "" + bloodtype + "" + units;
	}


}
