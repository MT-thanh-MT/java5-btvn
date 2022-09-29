package com.example.jpahomework.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TBLKhoa {
    @Id
    @Column(name = "Makhoa", nullable = false, length = 10)
    private String id;

    @Column(name = "Tenkhoa", length = 30)
    private String tenkhoa;

    @Column(name = "Dienthoai", length = 10)
    private String dienthoai;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTenkhoa() {
        return tenkhoa;
    }

    public void setTenkhoa(String tenkhoa) {
        this.tenkhoa = tenkhoa;
    }

    public String getDienthoai() {
        return dienthoai;
    }

    public void setDienthoai(String dienthoai) {
        this.dienthoai = dienthoai;
    }

}