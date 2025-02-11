package com.idelab.ideblog.repositories;

import com.idelab.ideblog.models.Post;
import com.idelab.ideblog.models.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface PostRepository extends JpaRepository<Post,Long> {
    List<Post> findByUsuarioId(Usuario usuarioId);


}
