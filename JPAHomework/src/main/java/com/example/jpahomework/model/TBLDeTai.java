package com.example.jpahomework.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class TBLDeTai {
    @Id
    @Column(name = "Madt", nullable = false, length = 10)
    private String id;

    @Column(name = "Tendt", length = 30)
    private String tendt;

    @Column(name = "Kinhphi")
    private Integer kinhphi;

    @Column(name = "Noithuctap", length = 30)
    private String noithuctap;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTendt() {
        return tendt;
    }

    public void setTendt(String tendt) {
        this.tendt = tendt;
    }

    public Integer getKinhphi() {
        return kinhphi;
    }

    public void setKinhphi(Integer kinhphi) {
        this.kinhphi = kinhphi;
    }

    public String getNoithuctap() {
        return noithuctap;
    }

    public void setNoithuctap(String noithuctap) {
        this.noithuctap = noithuctap;
    }

}