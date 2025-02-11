package com.idelab.ideblog.models;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "comentarios")
public class Comentario {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    @Lob
    @Column(nullable = false)
    private String conteudo;
    @ManyToOne
    @JoinColumn(name = "usuario_id",nullable = false)
    private Usuario usuario;
    @ManyToOne
    @JoinColumn(name = "post_id",nullable = false)
    private Post post;

    @Column(name = "criado_em",nullable = false)
    @CreationTimestamp
    private LocalDateTime criadoEm;
}
