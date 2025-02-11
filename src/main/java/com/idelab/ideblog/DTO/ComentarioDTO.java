package com.idelab.ideblog.DTO;

public record ComentarioDTO(Long id, String conteudo, Long usuarioId, Long postId) {
}
