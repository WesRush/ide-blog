package com.idelab.ideblog.DTO;

public record PostDTO(Long id,String titulo,String conteudo,String imagemUrl,String videoUrl,Long categoriaId, Long usuarioId) {
}
