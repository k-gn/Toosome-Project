package com.web.toosome.admin.sns.dao;

public class SnsDAO {
	private int sns_Accreditation_Id;
	private String sns_Accreditation_Random;

	public int getSns_Accreditation_Id() {
		return sns_Accreditation_Id;
	}

	public void setSns_Accreditation_Id(int sns_Accreditation_Id) {
		this.sns_Accreditation_Id = sns_Accreditation_Id;
	}

	public String getSns_Accreditation_Random() {
		return sns_Accreditation_Random;
	}

	public void setSns_Accreditation_Random(String sns_Accreditation_Random) {
		this.sns_Accreditation_Random = sns_Accreditation_Random;
	}

	@Override
	public String toString() {
		return "SnsDAO [sns_Accreditation_Id=" + sns_Accreditation_Id + ", sns_Accreditation_Random="
				+ sns_Accreditation_Random + "]";
	}
	
	
}
