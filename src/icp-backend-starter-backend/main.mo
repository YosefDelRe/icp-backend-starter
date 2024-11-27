//Nombre: Jose de Jesus Muñoz Cardenas
//Pais: México
//Experiencia: Practicas Profesionales en FiveCo
actor Echo {

  var name: Text = "Jose";

  // Say the given phase.
  public query func say() : async Text {
    return name;
  };

  public func saveName(name2: Text){
    name := name2;
  };
};
