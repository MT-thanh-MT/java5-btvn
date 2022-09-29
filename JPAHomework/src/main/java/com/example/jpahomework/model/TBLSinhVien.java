package com.example.jpahomework.model;

import javax.persistence.*;

@Entity
public class TBLSinhVien {
    @Id
    @Column(name = "Masv", nullable = false)
    private Integer id;

    @Column(name = "Hotensv", length = 40)
    private String hotensv;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Makhoa")
    private TBLKhoa makhoa;

    @Column(name = "Namsinh")
    private Integer namsinh;

    @Column(name = "Quequan", length = 30)
    private String quequan;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHotensv() {
        return hotensv;
    }

    public void setHotensv(String hotensv) {
        this.hotensv = hotensv;
    }

    public TBLKhoa getMakhoa() {
        return makhoa;
    }

    public void setMakhoa(TBLKhoa makhoa) {
        this.makhoa = makhoa;
    }

    public Integer getNamsinh() {
        return namsinh;
    }

    public void setNamsinh(Integer namsinh) {
        this.namsinh = namsinh;
    }

    public String getQuequan() {
        return quequan;
    }

    public void setQuequan(String quequan) {
        this.quequan = quequan;
    }

}