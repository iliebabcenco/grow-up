
package domain;

import java.util.Objects;
import java.sql.Date;

public class Request {
    private int id;
    private String name;
    private String surename;
    private String idnp;
    private Date birthday;
    private String card_id;
    private String residence;
    private int sum;
    private int term;
    private String mail;
    private String phone;
    private String income;
    private String fileName;
    private byte[] fileData;
    

    public Request(int id, String name, String surename, String idnp, Date birthday, String card_id, String residence, int sum, int term, String mail, String phone, String income, String fileName, byte[] fileData) {
        this.id = id;
        this.name = name;
        this.surename = surename;
        this.idnp = idnp;
        this.birthday = birthday;
        this.card_id = card_id;
        this.residence = residence;
        this.sum = sum;
        this.term = term;
        this.mail = mail;
        this.phone = phone;
        this.income = income;
        this.fileName = fileName;
        this.fileData = fileData;
    }
    

    public Request(int id, String name, String surename, String idnp, Date birthday, String card_id, 
            String residence, int sum, int term, String mail, String phone, String income) {
        this.id = id;
        this.name = name;
        this.surename = surename;
        this.idnp = idnp;
        this.birthday = birthday;
        this.card_id = card_id;
        this.residence = residence;
        this.sum = sum;
        this.term = term;
        this.mail = mail;
        this.phone = phone;
        this.income = income;
    }

    public Request() {
    }

    public Request(int id) {
        this.id = id;
    }

    

    public String getIncome() {
        return income;
    }

    public void setIncome(String income) {
        this.income = income;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurename() {
        return surename;
    }

    public void setSurename(String surename) {
        this.surename = surename;
    }

    public String getIdnp() {
        return idnp;
    }

    public void setIdnp(String idnp) {
        this.idnp = idnp;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getCard_id() {
        return card_id;
    }

    public void setCard_id(String card_id) {
        this.card_id = card_id;
    }

    public String getResidence() {
        return residence;
    }

    public void setResidence(String residence) {
        this.residence = residence;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Request{" + "id=" + id + ", name=" + name + ", surename=" + 
                surename + ", idnp=" + idnp + ", birthday=" + birthday + ", card_id=" + 
                card_id + ", residence=" + residence + ", sum=" + sum + ", mail=" + mail + 
                ", phone=" + phone + ", income=" + income + '}';
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 89 * hash + this.id;
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Request other = (Request) obj;
        if (this.id != other.id) {
            return false;
        }
        return true;
    }

    
    

    public int getTerm() {
        return term;
    }

    public void setTerm(int term) {
        this.term = term;
    }

    public String getFileName() {
        return fileName;
    }

    public byte[] getFileData() {
        return fileData;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public void setFileData(byte[] fileData) {
        this.fileData = fileData;
    }
    
    
    
}
