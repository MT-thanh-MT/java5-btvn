package com.example.jpahomework.model;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
public class TBLGiangVien {
    @Id
    @Column(name = "Magv", nullable = false)
    private Integer id;

    @Column(name = "Hotengv", length = 30)
    private String hotengv;

    @Column(name = "Luong", precision = 5, scale = 2)
    private BigDecimal luong;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Makhoa")
    private TBLKhoa makhoa;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getHotengv() {
        return hotengv;
    }

    public void setHotengv(String hotengv) {
        this.hotengv = hotengv;
    }

    public BigDecimal getLuong() {
        return luong;
    }

    public void setLuong(BigDecimal luong) {
        this.luong = luong;
    }

    public TBLKhoa getMakhoa() {
        return makhoa;
    }

    public void setMakhoa(TBLKhoa makhoa) {
        this.makhoa = makhoa;
    }

}