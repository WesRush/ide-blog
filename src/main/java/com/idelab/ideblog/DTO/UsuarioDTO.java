package com.idelab.ideblog.DTO;

import com.idelab.ideblog.models.TipoUsuario;

public record UsuarioDTO(Long id, String nome, String email, TipoUsuario tipo) {
}
