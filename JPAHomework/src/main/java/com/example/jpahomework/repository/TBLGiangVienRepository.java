package com.example.jpahomework.repository;

import com.example.jpahomework.model.TBLGiangVien;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TBLGiangVienRepository extends JpaRepository<TBLGiangVien, Integer>, JpaSpecificationExecutor<TBLGiangVien> {
}