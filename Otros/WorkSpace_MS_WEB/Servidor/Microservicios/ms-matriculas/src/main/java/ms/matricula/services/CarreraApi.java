/**
 * NOTE: This class is auto generated by the swagger code generator program (2.2.3).
 * https://github.com/swagger-api/swagger-codegen
 * Do not edit the class manually.
 */
package ms.matricula.services;

import ms.matricula.model.Carrera;

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
@javax.annotation.Generated(value = "io.swagger.codegen.languages.SpringCodegen", date = "2017-12-16T19:17:33.453Z")

@Api(value = "carrera", description = "the carrera API")
public interface CarreraApi {

    @ApiOperation(value = "Ingresar en la base de datos una nueva carrera", notes = "Integrar en la base de datos la informacion de un nueva carrera.", response = Void.class, tags={ "Carrera", })
    @ApiResponses(value = { 
        @ApiResponse(code = 202, message = "Operacion realizada con exito", response = Void.class),
        @ApiResponse(code = 405, message = "Operacion sin realizar", response = Void.class),
        @ApiResponse(code = 500, message = "Internal Server Error", response = Void.class) })
    
    @RequestMapping(value = "/carrera",
        method = RequestMethod.POST)
    ResponseEntity<Void> carreraPost(@ApiParam(value = "Objeto JSON del contenido de la carrera" ,required=true )  @Valid @RequestBody Carrera carrera);

}
