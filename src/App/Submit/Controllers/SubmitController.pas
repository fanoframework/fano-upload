(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit SubmitController;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano;

type

    (*!-----------------------------------------------
     * controller that handle route :
     * /submit
     *
     * See Routes/Submit/routes.inc
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TSubmitController = class(TRouteHandler, IDependency)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse
        ) : IResponse; override;
    end;

implementation

uses

    SysUtils;

    function TSubmitController.handleRequest(
          const request : IRequest;
          const response : IResponse
    ) : IResponse;
    var uploadedFile : IUploadedFile;
        targetFilename : string;
    begin
        {---put your code here---}
        uploadedFile := request.getUploadedFile('imageData');
        response.body().write('get upload');
        targetFilename := extractFileDir(getCurrentDir()) + '/storages/upload/' + uploadedFile.getClientFilename();
        uploadedFile.moveTo(targetFilename);
        response.body().write(targetFilename + ' uploaded successfully');
        result := response;
    end;

end.
