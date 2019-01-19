(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit UploadView;

interface

{$MODE OBJFPC}
{$H+}

uses

    fano;

type

    (*!-----------------------------------------------
     * View instance
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TUploadView = class(TInjectableObject, IView)
    private
        fileReader : IFileReader;
    public
        constructor create(const freader : IFileReader);
        destructor destroy(); override;

        (*!------------------------------------------------
         * render view
         *------------------------------------------------
         * @param viewParams view parameters
         * @param response response instance
         * @return response
         *-----------------------------------------------*)
        function render(
            const viewParams : IViewParameters;
            const response : IResponse
        ) : IResponse;
    end;

implementation

uses

    sysutils;

    constructor TUploadView.create(const freader : IFileReader);
    begin
        fileReader := freader;
    end;

    destructor TUploadView.destroy();
    begin
        inherited destroy();
        fileReader := nil;
    end;

    (*!------------------------------------------------
     * render view
     *------------------------------------------------
     * @param viewParams view parameters
     * @param response response instance
     * @return response
     *-----------------------------------------------*)
    function TUploadView.render(
        const viewParams : IViewParameters;
        const response : IResponse
    ) : IResponse;
    var templateFile : string;
    begin
        templateFile := extractFileDir(getCurrentDir()) + '/src/Templates/upload.html';
        response.body().write(fileReader.readFile(templateFile));
        result := response;
    end;

end.
