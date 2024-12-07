//Nombre: Jose de Jesus Muñoz Cardenas
//Pais: México
//Experiencia: Practicas Profesionales en FiveCo
import Array "mo:base/Array";

actor Echo {

  type Library = {
    id: Nat;
    title: Text;
    autor: Text;
    available: Bool;
  };

  var count = 1;
  var avBooks : [Library] = []; //Lista de libros disponibles
  var noBooks : [Library] = []; //Lista de libros no disponibles

  //Agregar libro disponible
  public func addAvBook(nameBook: Text, nameAutor: Text) : (){

    let newBook : Library = {
      id = count;
      title = nameBook;
      autor = nameAutor;
      available = true;
    };

    avBooks := Array.append(avBooks, [newBook]);
    count := count + 1;

  };

  //Agregar libro no disponible
  public func addNoBook(nameBook: Text, nameAutor: Text) : (){

    let newBook : Library = {
      id = count;
      title = nameBook;
      autor = nameAutor;
      available = false;
    };

    noBooks := Array.append(noBooks, [newBook]);
    count := count + 1;
  };

  //Devolver todos los libros disponibles
  public query func availableBooks() : async [Library]{
    return avBooks;
  };

  //Devolver todos los libros que no esten disponibles
  public query func availableNoBooks() : async [Library]{
    return noBooks;
  };

  /*************************Funciones de Busqueda*********************************/
  //Buscar libro disponible por titulo
  public query func searchAvBook(name: Text) : async ?Library{
    for(i in avBooks.vals()){
      if(i.title == name){
        return ?i;
      };
    };
    return null;
  };

  //Buscar libro no disponible por titulo
  public query func searchNoBook(name: Text) : async ?Library{
    for(i in noBooks.vals()){
      if(i.title == name){
        return ?i;
      };
    };
    return null;
  };

  //Buscar libro disponible por id
  public query func searchAvId(element: Nat) : async ?Library{
    for(i in avBooks.vals()){
      if(i.id == element){
        return ?i;
      };
    };
    return null;
  };

  //Buscar libro no disponible por id
  public query func searchNoId(element: Nat) : async ?Library{
    for(i in noBooks.vals()){
      if(i.id == element){
        return ?i;
      };
    };
    return null;
  };
  /*****************************Fin de Funciones de Busqueda***********************************/

  //Cambiar un libro disponible por uno no disponible
  public func changeToNoBook(nameBook: Text, nameAutor: Text) : (){
    var yesList : [Library] = [];
    for(i in avBooks.vals()){
      if(i.title == nameBook and i.autor == nameAutor){
        let newBook: Library = {
          id = i.id;
          title = i.title;
          autor = i.autor;
          available = false;
        };
        noBooks := Array.append(noBooks, [newBook]);
      }else{
        yesList := Array.append(yesList, [i]);
      };
    };
      avBooks := yesList;
  };

  //Cambiar un libro no disponible por uno disponible
  public func changeToYesBook(nameBook: Text, nameAutor: Text) : (){
    var noList : [Library] = [];
    for(i in noBooks.vals()){
      if(i.title == nameBook and i.autor == nameAutor){
        let newBook: Library = {
          id = i.id;
          title = i.title;
          autor = i.autor;
          available = true;
        };
        avBooks := Array.append(avBooks, [newBook]);
      }else{
        noList := Array.append(noList, [i]);
      };
    };
      noBooks := noList;
  };

  //Eliminar libros que no esten disponibles
  public func removeBook(element: Nat) : (){
    var list : [Library] = [];
    for(i in noBooks.vals()){
      if(i.id != element){
        list := Array.append(list, [i]);
      };
    };
    noBooks := list;
  };
  
};
