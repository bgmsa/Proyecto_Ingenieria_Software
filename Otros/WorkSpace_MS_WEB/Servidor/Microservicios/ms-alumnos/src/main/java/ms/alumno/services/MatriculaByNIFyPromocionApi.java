/**
 * NOTE: This class is auto generated by the swagger code generator program (2.2.3).
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */
package ms.alumno.services;

import ms.alumno.model.Matricula;

import io.swagger.annotations.*;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;
import javax.validation.constraints.*;
import javax.validation.Valid;
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-12-16T19:24:41.547Z")

@Api(value = "matriculaByNIFyPromocion", description = "the matriculaByNIFyPromocion API")
public interface MatriculaByNIFyPromocionApi {

    @ApiOperation(value = "Eliminar matricula por la promocion del alumno", notes = "Eliminar la matricula de la base de datos de una promocion (si la base de datos lo permite)", response = Void.class, tags={ "Matricula", })
    @ApiResponses(value = { 
        @ApiResponse(code = 201, message = "Operacion realizada con exito", response = Void.class),
        @ApiResponse(code = 405, message = "Operacion sin realizar", response = Void.class),
        @ApiResponse(code = 500, message = "Internal Server Error", response = Void.class) })
    
    @RequestMapping(value = "/matriculaByNIFyPromocion/{NIF}/{promocion}",
        method = RequestMethod.DELETE)
    ResponseEntity<Void> matriculaByNIFyPromocionNIFPromocionDelete(@ApiParam(value = "Promocion de la matricula",required=true ) @PathVariable("promocion") Integer promocion);


    @ApiOperation(value = "Obtener la matricula de un alumno de un anno especifico", notes = "Devuelve la matricula con una lista de codigos de las asignaturas  matriculadas.", response = Matricula.class, tags={ "Matricula", })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Operacion realizada con exito", response = Matricula.class),
        @ApiResponse(code = 405, message = "Operacion sin realizar", response = Void.class),
        @ApiResponse(code = 500, message = "Internal Server Error", response = Void.class) })
    
    @RequestMapping(value = "/matriculaByNIFyPromocion/{NIF}/{promocion}",
        method = RequestMethod.GET)
    ResponseEntity<Matricula> matriculaByNIFyPromocionNIFPromocionGet(@ApiParam(value = "NIF del alumno",required=true ) @PathVariable("NIF") String NIF,@ApiParam(value = "Promocion de la matricula que se esta buscando",required=true ) @PathVariable("promocion") Integer promocion);


    @ApiOperation(value = "Actualizar matricula por promocion de un alumno", notes = "Actualizacion de la informacion de una matricula de un alumno determinado (la consulta se realiza si lo acepta la base de datos)", response = Void.class, tags={ "Matricula", })
    @ApiResponses(value = { 
        @ApiResponse(code = 202, message = "Operacion realizada con exito", response = Void.class),
        @ApiResponse(code = 405, message = "Operacion sin realizar", response = Void.class),
        @ApiResponse(code = 500, message = "Internal Server Error", response = Void.class) })
    
    @RequestMapping(value = "/matriculaByNIFyPromocion/{NIF}/{promocion}",
        method = RequestMethod.PUT)
    ResponseEntity<Void> matriculaByNIFyPromocionNIFPromocionPut(@ApiParam(value = "Promocion de la matricula que se quiere actualizar",required=true ) @PathVariable("promocion") Integer promocion,@ApiParam(value = "Objeto JSON del contenido de la matricula" ,required=true )  @Valid @RequestBody Matricula matricula);

}
