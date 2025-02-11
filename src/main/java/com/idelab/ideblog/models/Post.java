package com.idelab.ideblog.models;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
@Table(name = "posts")
@Entity
public class Post {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Lob
    @Column(nullable = false)
    private String conteudo;
    private String imagemUrl;
    private String videoUrl;

    @ManyToOne
    @JoinColumn(name = "categoria_id",nullable = false)
    private Categoria categoria;

    @ManyToOne
    @JoinColumn(name = "usuario_id",nullable = false)
    private Usuario usuario;

    @Column(name="criado_em",updatable = false)
    @CreationTimestamp
    private LocalDateTime criadoEm;
    @Column(name = "atualizado_em")
    @UpdateTimestamp
    private LocalDateTime atualizadoEm;
}
