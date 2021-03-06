/**
 * NOTE: This class is auto generated by the swagger code generator program (2.2.3).
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */
package ms.alumno.services;

import ms.alumno.model.Alumno;

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

@Api(value = "alumnoByNIF", description = "the alumnoByNIF API")
public interface AlumnoByNIFApi {

    @ApiOperation(value = "Eliminar alumno por NIF", notes = "Eliminar la cuenta de un almuno por NIF", response = Void.class, tags={ "Alumno", })
    @ApiResponses(value = { 
        @ApiResponse(code = 201, message = "Operacion realizada con exito", response = Void.class),
        @ApiResponse(code = 405, message = "Operacion sin realizar", response = Void.class),
        @ApiResponse(code = 500, message = "Internal Server Error", response = Void.class) })
    
    @RequestMapping(value = "/alumnoByNIF/{NIF}",
        method = RequestMethod.DELETE)
    ResponseEntity<Void> alumnoByNIFNIFDelete(@ApiParam(value = "NIF del alumno",required=true ) @PathVariable("NIF") String NIF);


    @ApiOperation(value = "Obtener alumno por NIF", notes = "Busqueda de la informacion de un alumno con su NIF", response = Alumno.class, tags={ "Alumno", })
    @ApiResponses(value = { 
        @ApiResponse(code = 200, message = "Operacion realizada con exito", response = Alumno.class),
        @ApiResponse(code = 405, message = "Operacion sin realizar", response = Void.class),
        @ApiResponse(code = 500, message = "Internal Server Error", response = Void.class) })
    
    @RequestMapping(value = "/alumnoByNIF/{NIF}",
        method = RequestMethod.GET)
    ResponseEntity<Alumno> alumnoByNIFNIFGet(@ApiParam(value = "NIF del alumno",required=true ) @PathVariable("NIF") String NIF);


    @ApiOperation(value = "Actualizar alumno", notes = "Actualizacion de la informacion de la cuenta de un alumno", response = Void.class, tags={ "Alumno", })
    @ApiResponses(value = { 
        @ApiResponse(code = 202, message = "Operacion realizada con exito", response = Void.class),
        @ApiResponse(code = 405, message = "Operacion sin realizar", response = Void.class),
        @ApiResponse(code = 500, message = "Internal Server Error", response = Void.class) })
    
    @RequestMapping(value = "/alumnoByNIF/{NIF}",
        method = RequestMethod.PUT)
    ResponseEntity<Void> alumnoByNIFNIFPut(@ApiParam(value = "NIF del alumno que se quiere actualizar",required=true ) @PathVariable("NIF") String NIF,@ApiParam(value = "Objeto JSON del contenido del alumno" ,required=true )  @Valid @RequestBody Alumno alumno);

}
