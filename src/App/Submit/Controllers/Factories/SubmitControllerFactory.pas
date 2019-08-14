(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit SubmitControllerFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for controller TSubmitController
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    TSubmitControllerFactory = class(TFactory, IDependencyFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses
    sysutils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    SubmitController;

    function TSubmitControllerFactory.build(const container : IDependencyContainer) : IDependency;
    var routeMiddlewares : IMiddlewareCollectionAware;
    begin
        routeMiddlewares := container.get('routeMiddlewares') as IMiddlewareCollectionAware;
        try
            result := TSubmitController.create(routeMiddlewares);
        finally
            routeMiddlewares := nil;
        end;
    end;
end.
