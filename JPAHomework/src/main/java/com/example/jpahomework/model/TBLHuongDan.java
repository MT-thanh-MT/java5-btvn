package com.example.jpahomework.model;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
public class TBLHuongDan {
    @Id
    @Column(name = "Masv", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Madt")
    private TBLDeTai madt;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "Magv")
    private TBLGiangVien magv;

    @Column(name = "KetQua", precision = 5, scale = 2)
    private BigDecimal ketQua;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public TBLDeTai getMadt() {
        return madt;
    }

    public void setMadt(TBLDeTai madt) {
        this.madt = madt;
    }

    public TBLGiangVien getMagv() {
        return magv;
    }

    public void setMagv(TBLGiangVien magv) {
        this.magv = magv;
    }

    public BigDecimal getKetQua() {
        return ketQua;
    }

    public void setKetQua(BigDecimal ketQua) {
        this.ketQua = ketQua;
    }

}