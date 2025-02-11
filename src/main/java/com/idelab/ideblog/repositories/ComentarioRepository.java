package com.idelab.ideblog.repositories;

import com.idelab.ideblog.models.Comentario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ComentarioRepository extends JpaRepository <Comentario,Long> {
    List<Comentario> findByPost_Id(Long postId);
}
