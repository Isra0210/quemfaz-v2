import 'dart:convert';

SegmentAndProvider segmentAndProviderFromJson(String str) => SegmentAndProvider.fromJson(json.decode(str));

String segmentAndProviderToJson(SegmentAndProvider data) => json.encode(data.toJson());

class SegmentAndProvider {
    SegmentAndProvider({
        this.segmentos,
        this.prestadores,
    });

    List<Segmento> segmentos;
    List<Prestadores> prestadores;

    factory SegmentAndProvider.fromJson(Map<String, dynamic> json) => SegmentAndProvider(
        segmentos: List<Segmento>.from(json["segmentos"].map((x) => Segmento.fromJson(x))),
        prestadores: List<Prestadores>.from(json["prestadores"].map((x) => Prestadores.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "segmentos": List<dynamic>.from(segmentos.map((x) => x.toJson())),
        "prestadores": List<dynamic>.from(prestadores.map((x) => x.toJson())),
    };
}

class Prestadores {
    Prestadores({
        this.id,
        this.documento,
        this.nomeFantasia,
        this.pessoaResponsavel,
        this.email,
        this.login,
        this.periodo,
        this.status,
        this.descricao,
        this.especializacao,
        this.diferenciais,
        this.contatos,
        this.fotos,
        this.segmentos,
        this.createAt,
        this.updateAt,
        this.infoPlano,
        this.descricaoPrevia,
        this.logoUrl,
    });

    String id;
    String documento;
    String nomeFantasia;
    String pessoaResponsavel;
    String email;
    String login;
    String periodo;
    String status;
    String descricao;
    String especializacao;
    String diferenciais;
    List<Contato> contatos;
    List<Foto> fotos;
    List<Segmento> segmentos;
    DateTime createAt;
    DateTime updateAt;
    InfoPlano infoPlano;
    String descricaoPrevia;
    String logoUrl;

    factory Prestadores.fromJson(Map<String, dynamic> json) => Prestadores(
        id: json["id"],
        documento: json["documento"],
        nomeFantasia: json["nomeFantasia"],
        pessoaResponsavel: json["pessoaResponsavel"],
        email: json["email"],
        login: json["login"],
        periodo: json["periodo"],
        status: json["status"],
        descricao: json["descricao"],
        especializacao: json["especializacao"],
        diferenciais: json["diferenciais"],
        contatos: json["contatos"] == null ? null : List<Contato>.from(json["contatos"].map((x) => Contato.fromJson(x))),
        fotos: List<Foto>.from(json["fotos"].map((x) => Foto.fromJson(x))),
        segmentos: List<Segmento>.from(json["segmentos"].map((x) => Segmento.fromJson(x))),
        createAt: DateTime.parse(json["createAt"]),
        updateAt: DateTime.parse(json["updateAt"]),
        infoPlano: InfoPlano.fromJson(json["infoPlano"]),
        descricaoPrevia: json["descricaoPrevia"],
        logoUrl: json["logoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "documento": documento,
        "nomeFantasia": nomeFantasia,
        "pessoaResponsavel": pessoaResponsavel,
        "email": email,
        "login": login,
        "periodo": periodo,
        "status": status,
        "descricao": descricao,
        "especializacao": especializacao,
        "diferenciais": diferenciais,
        "contatos": contatos == null ? null : List<dynamic>.from(contatos.map((x) => x.toJson())),
        "fotos": List<dynamic>.from(fotos.map((x) => x.toJson())),
        "segmentos": List<dynamic>.from(segmentos.map((x) => x.toJson())),
        "createAt": createAt.toIso8601String(),
        "updateAt": updateAt.toIso8601String(),
        "infoPlano": infoPlano.toJson(),
        "descricaoPrevia": descricaoPrevia,
        "logoUrl": logoUrl,
    };
}

class Contato {
    Contato({
        this.id,
        this.valor,
        this.createAt,
        this.updateAt,
        this.value,
        this.label,
    });

    String id;
    String valor;
    DateTime createAt;
    DateTime updateAt;
    String value;
    String label;

    factory Contato.fromJson(Map<String, dynamic> json) => Contato(
        id: json["id"],
        valor: json["valor"],
        createAt: DateTime.parse(json["createAt"]),
        updateAt: DateTime.parse(json["updateAt"]),
        value: json["value"],
        label: json["label"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "valor": valor,
        "createAt": createAt.toIso8601String(),
        "updateAt": updateAt.toIso8601String(),
        "value": value,
        "label": label,
    };
}

class Foto {
    Foto({
        this.id,
        this.nome,
        this.capa,
        this.createAt,
        this.updateAt,
        this.fotoUrl,
    });

    String id;
    String nome;
    bool capa;
    DateTime createAt;
    DateTime updateAt;
    String fotoUrl;

    factory Foto.fromJson(Map<String, dynamic> json) => Foto(
        id: json["id"],
        nome: json["nome"],
        capa: json["capa"],
        createAt: DateTime.parse(json["createAt"]),
        updateAt: DateTime.parse(json["updateAt"]),
        fotoUrl: json["fotoUrl"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "capa": capa,
        "createAt": createAt.toIso8601String(),
        "updateAt": updateAt.toIso8601String(),
        "fotoUrl": fotoUrl,
    };
}

class InfoPlano {
    InfoPlano({
        this.name,
        this.limiteFotos,
        this.upload,
    });

    String name;
    int limiteFotos;
    bool upload;

    factory InfoPlano.fromJson(Map<String, dynamic> json) => InfoPlano(
        name: json["name"],
        limiteFotos: json["limiteFotos"],
        upload: json["upload"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "limiteFotos": limiteFotos,
        "upload": upload,
    };
}

class Segmento {
    Segmento({
        this.id,
        this.nome,
        this.descricao,
        this.icon,
        this.createAt,
        this.updateAt,
        this.fotoUrl,
        this.thumb,
    });

    String id;
    String nome;
    String descricao;
    dynamic icon;
    DateTime createAt;
    DateTime updateAt;
    String fotoUrl;
    String thumb;

    factory Segmento.fromJson(Map<String, dynamic> json) => Segmento(
        id: json["id"],
        nome: json["nome"],
        descricao: json["descricao"] == null ? null : json["descricao"],
        icon: json["icon"],
        createAt: DateTime.parse(json["createAt"]),
        updateAt: DateTime.parse(json["updateAt"]),
        fotoUrl: json["fotoUrl"],
        thumb: json["thumb"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nome": nome,
        "descricao": descricao == null ? null : descricao,
        "icon": icon,
        "createAt": createAt.toIso8601String(),
        "updateAt": updateAt.toIso8601String(),
        "fotoUrl": fotoUrl,
        "thumb": thumb,
    };
}
