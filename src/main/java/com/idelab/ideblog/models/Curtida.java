package com.idelab.ideblog.models;

import jakarta.persistence.*;
import org.hibernate.annotations.CreationTimestamp;

import java.time.LocalDateTime;

@Entity
@Table(name = "curtidas")
public class Curtida {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "usuario_id",nullable = false)
    private Usuario usuario;
    @ManyToOne
    @JoinColumn(name = "post_id",nullable = false)
    private Post post;

    @Column(name = "criado_em",updatable = false)
    @CreationTimestamp
    private LocalDateTime criadoEm;
}
