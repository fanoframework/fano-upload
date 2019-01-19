(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit UploadControllerFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TUploadController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TUploadControllerFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    UploadController;

    function TUploadControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var routeMiddlewares : IMiddlewareCollectionAware;
    begin
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        try
            result := TUploadController.create(
                routeMiddlewares.getBefore(),
                routeMiddlewares.getAfter(),
                container.get('uploadView') as IView,
                container.get('uploadViewParams') as IViewParameters
            );
        finally
            routeMiddlewares := nil;
        end;
    end;
end.
