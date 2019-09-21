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
    TSubmitController = class(TAbstractController)
    public
        function handleRequest(
            const request : IRequest;
            const response : IResponse;
            const args : IRouteArgsReader
        ) : IResponse; override;
    end;

implementation

uses

    SysUtils;

    function TSubmitController.handleRequest(
        const request : IRequest;
        const response : IResponse;
        const args : IRouteArgsReader
    ) : IResponse;
    var uploadedFiles : IUploadedFileArray;
        targetFilename : string;
        i, len : integer;
    begin
        {---put your code here---}
        uploadedFiles := request.getUploadedFile('imageData');
        len := length(uploadedFiles);
        for i:=0 to len-1 do
        begin
            targetFilename := extractFileDir(getCurrentDir()) + '/storages/upload/' + uploadedFiles[i].getClientFilename();
            uploadedFiles[i].moveTo(targetFilename);
            response.body().write(targetFilename + ' uploaded successfully');
        end;
        result := response;
    end;

end.
