/**
 * @license
 * Copyright Google LLC All Rights Reserved.
 *
 * Use of this source code is governed by an MIT-style license that can be
 * found in the LICENSE file at https://angular.io/license
 */
import { Inject, Injectable, InjectionToken, ɵɵinject } from '@angular/core';
import { getDOM } from '../dom_adapter';
import { DOCUMENT } from '../dom_tokens';
import * as i0 from "@angular/core";
/**
 * This class should not be used directly by an application developer. Instead, use
 * {@link Location}.
 *
 * `PlatformLocation` encapsulates all calls to DOM APIs, which allows the Router to be
 * platform-agnostic.
 * This means that we can have different implementation of `PlatformLocation` for the different
 * platforms that Angular supports. For example, `@angular/platform-browser` provides an
 * implementation specific to the browser environment, while `@angular/platform-server` provides
 * one suitable for use with server-side rendering.
 *
 * The `PlatformLocation` class is used directly by all implementations of {@link LocationStrategy}
 * when they need to interact with the DOM APIs like pushState, popState, etc.
 *
 * {@link LocationStrategy} in turn is used by the {@link Location} service which is used directly
 * by the {@link Router} in order to navigate between routes. Since all interactions between {@link
 * Router} /
 * {@link Location} / {@link LocationStrategy} and DOM APIs flow through the `PlatformLocation`
 * class, they are all platform-agnostic.
 *
 * @publicApi
 */
import * as ɵngcc0 from '@angular/core';
export class PlatformLocation {
}
PlatformLocation.ɵfac = function PlatformLocation_Factory(t) { return new (t || PlatformLocation)(); };
PlatformLocation.ɵprov = i0.ɵɵdefineInjectable({ factory: useBrowserPlatformLocation, token: PlatformLocation, providedIn: "platform" });
/*@__PURE__*/ (function () { ɵngcc0.ɵsetClassMetadata(PlatformLocation, [{
        type: Injectable,
        args: [{
                providedIn: 'platform',
                // See #23917
                useFactory: useBrowserPlatformLocation
            }]
    }], null, null); })();
export function useBrowserPlatformLocation() {
    return ɵɵinject(BrowserPlatformLocation);
}
/**
 * @description
 * Indicates when a location is initialized.
 *
 * @publicApi
 */
export const LOCATION_INITIALIZED = new InjectionToken('Location Initialized');
/**
 * `PlatformLocation` encapsulates all of the direct calls to platform APIs.
 * This class should not be used directly by an application developer. Instead, use
 * {@link Location}.
 */
export class BrowserPlatformLocation extends PlatformLocation {
    constructor(_doc) {
        super();
        this._doc = _doc;
        this._init();
    }
    // This is moved to its own method so that `MockPlatformLocationStrategy` can overwrite it
    /** @internal */
    _init() {
        this.location = getDOM().getLocation();
        this._history = getDOM().getHistory();
    }
    getBaseHrefFromDOM() {
        return getDOM().getBaseHref(this._doc);
    }
    onPopState(fn) {
        getDOM().getGlobalEventTarget(this._doc, 'window').addEventListener('popstate', fn, false);
    }
    onHashChange(fn) {
        getDOM().getGlobalEventTarget(this._doc, 'window').addEventListener('hashchange', fn, false);
    }
    get href() {
        return this.location.href;
    }
    get protocol() {
        return this.location.protocol;
    }
    get hostname() {
        return this.location.hostname;
    }
    get port() {
        return this.location.port;
    }
    get pathname() {
        return this.location.pathname;
    }
    get search() {
        return this.location.search;
    }
    get hash() {
        return this.location.hash;
    }
    set pathname(newPath) {
        this.location.pathname = newPath;
    }
    pushState(state, title, url) {
        if (supportsState()) {
            this._history.pushState(state, title, url);
        }
        else {
            this.location.hash = url;
        }
    }
    replaceState(state, title, url) {
        if (supportsState()) {
            this._history.replaceState(state, title, url);
        }
        else {
            this.location.hash = url;
        }
    }
    forward() {
        this._history.forward();
    }
    back() {
        this._history.back();
    }
    getState() {
        return this._history.state;
    }
}
BrowserPlatformLocation.ɵfac = function BrowserPlatformLocation_Factory(t) { return new (t || BrowserPlatformLocation)(ɵngcc0.ɵɵinject(DOCUMENT)); };
BrowserPlatformLocation.ɵprov = i0.ɵɵdefineInjectable({ factory: createBrowserPlatformLocation, token: BrowserPlatformLocation, providedIn: "platform" });
BrowserPlatformLocation.ctorParameters = () => [
    { type: undefined, decorators: [{ type: Inject, args: [DOCUMENT,] }] }
];
/*@__PURE__*/ (function () { ɵngcc0.ɵsetClassMetadata(BrowserPlatformLocation, [{
        type: Injectable,
        args: [{
                providedIn: 'platform',
                // See #23917
                useFactory: createBrowserPlatformLocation
            }]
    }], function () { return [{ type: undefined, decorators: [{
                type: Inject,
                args: [DOCUMENT]
            }] }]; }, null); })();
export function supportsState() {
    return !!window.history.pushState;
}
export function createBrowserPlatformLocation() {
    return new BrowserPlatformLocation(ɵɵinject(DOCUMENT));
}

//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoicGxhdGZvcm1fbG9jYXRpb24uanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uLy4uLy4uL3BhY2thZ2VzL2NvbW1vbi9zcmMvbG9jYXRpb24vcGxhdGZvcm1fbG9jYXRpb24udHMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsR0FBRztBQUVILE9BQU8sRUFBQyxNQUFNLEVBQUUsVUFBVSxFQUFFLGNBQWMsRUFBRSxRQUFRLEVBQUMsTUFBTSxlQUFlLENBQUM7QUFDM0UsT0FBTyxFQUFDLE1BQU0sRUFBQyxNQUFNLGdCQUFnQixDQUFDO0FBQ3RDLE9BQU8sRUFBQyxRQUFRLEVBQUMsTUFBTSxlQUFlLENBQUM7QUFDdkM7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQSxHQUFHOztBQU1ILE1BQU0sT0FBZ0IsZ0JBQWdCO0FBQ3RDO3VHQUFDO0FBQUM7NENBTkQsVUFBVSxTQUFDO01BQ1YsVUFBVSxFQUFFO0VBQVU7R0FDdEIsYUFBYSxpQkFDYjtHQUFVLEVBQUU7Q0FBMEIsY0FDdkM7OzBCQUNJO0FBdUJMLE1BQU0sVUFBVSwwQkFBMEI7QUFDMUMsSUFBRSxPQUFPLFFBQVEsQ0FBQyx1QkFBdUIsQ0FBQyxDQUFDO0FBQzNDLENBQUM7QUFFRDtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsR0FBRztBQUNILE1BQU0sQ0FBQyxNQUFNLG9CQUFvQixHQUFHLElBQUksY0FBYyxDQUFlLHNCQUFzQixDQUFDLENBQUM7QUFzQjdGO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsR0FBRztBQU1ILE1BQU0sT0FBTyx1QkFBd0IsU0FBUSxnQkFBZ0I7QUFDN0QsSUFHRSxZQUFzQyxJQUFTO0FBQ2pELFFBQUksS0FBSyxFQUFFLENBQUM7QUFDWixRQUZ3QyxTQUFJLEdBQUos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R0FBRyxDQUFDO0FBQy9CLFNBQUs7QUFDTCxJQUFFLENBQUM7QUFDSCxJQUNFLE9BQU87QUFBSyxRQUNWLElBQUksQ0FBQyxRQUFRLENBQUMsT0FBTyxFQUFFLENBQUM7QUFDNUIsSUFBRSxDQUFDO0FBQ0gsSUFDRSxJQUFJO0FBQUssUUFDUCxJQUFJLENBQUMsUUFBUSxDQUFDLElBQUksRUFBRSxDQUFDO0FBQ3pCLElBQUUsQ0FBQztBQUNILElBQ0UsUUFBUTtBQUFLLFFBQ1gsT0FBTyxJQUFJLENBQUMsUUFBUSxDQUFDLEtBQUssQ0FBQztBQUMvQixJQUFFLENBQUM7QUFDSDtxSkFBQztBQUNELDBKQWpGSztBQUFDO0VBTEwsVUFBVSxTQUFDLGtCQUNWLFVBQVUsRUFBRSxVQUFVLDdEQUkrQiw0Q0FJeEMsTUFBTSxTQUFDLFFBQVE7QUFBUTtDQVBwQyxhQUFhLGlCQUNiLFVBQVUsRUFBRSw2QkFBNkI7S0FDMUM7Ozs7Ozs7OztrQ0FLdUM7QUE4RXhDLE1BQU0sVUFBVSxhQUFhO0FBQUssSUFDaEMsT0FBTyxDQUFDLENBQUMsTUFBTSxDQUFDLE9BQU8sQ0FBQyxTQUFTLENBQUM7QUFDcEMsQ0FBQztBQUNELE1BQU0sVUFBVSw2QkFBNkI7QUFDN0MsSUFBRSxPQUFPLElBQUksdUJBQXVCLENBQUMsUUFBUSxDQUFDLFFBQVEsQ0FBQyxDQUFDLENBQUM7QUFDekQsQ0FBQztBQUNEIiwic291cmNlc0NvbnRlbnQiOlsiLyoqXG4gKiBAbGljZW5zZVxuICogQ29weXJpZ2h0IEdvb2dsZSBMTEMgQWxsIFJpZ2h0cyBSZXNlcnZlZC5cbiAqXG4gKiBVc2Ugb2YgdGhpcyBzb3VyY2UgY29kZSBpcyBnb3Zlcm5lZCBieSBhbiBNSVQtc3R5bGUgbGljZW5zZSB0aGF0IGNhbiBiZVxuICogZm91bmQgaW4gdGhlIExJQ0VOU0UgZmlsZSBhdCBodHRwczovL2FuZ3VsYXIuaW8vbGljZW5zZVxuICovXG5cbmltcG9ydCB7SW5qZWN0LCBJbmplY3RhYmxlLCBJbmplY3Rpb25Ub2tlbiwgybXJtWluamVjdH0gZnJvbSAnQGFuZ3VsYXIvY29yZSc7XG5pbXBvcnQge2dldERPTX0gZnJvbSAnLi4vZG9tX2FkYXB0ZXInO1xuaW1wb3J0IHtET0NVTUVOVH0gZnJvbSAnLi4vZG9tX3Rva2Vucyc7XG5cbi8qKlxuICogVGhpcyBjbGFzcyBzaG91bGQgbm90IGJlIHVzZWQgZGlyZWN0bHkgYnkgYW4gYXBwbGljYXRpb24gZGV2ZWxvcGVyLiBJbnN0ZWFkLCB1c2VcbiAqIHtAbGluayBMb2NhdGlvbn0uXG4gKlxuICogYFBsYXRmb3JtTG9jYXRpb25gIGVuY2Fwc3VsYXRlcyBhbGwgY2FsbHMgdG8gRE9NIEFQSXMsIHdoaWNoIGFsbG93cyB0aGUgUm91dGVyIHRvIGJlXG4gKiBwbGF0Zm9ybS1hZ25vc3RpYy5cbiAqIFRoaXMgbWVhbnMgdGhhdCB3ZSBjYW4gaGF2ZSBkaWZmZXJlbnQgaW1wbGVtZW50YXRpb24gb2YgYFBsYXRmb3JtTG9jYXRpb25gIGZvciB0aGUgZGlmZmVyZW50XG4gKiBwbGF0Zm9ybXMgdGhhdCBBbmd1bGFyIHN1cHBvcnRzLiBGb3IgZXhhbXBsZSwgYEBhbmd1bGFyL3BsYXRmb3JtLWJyb3dzZXJgIHByb3ZpZGVzIGFuXG4gKiBpbXBsZW1lbnRhdGlvbiBzcGVjaWZpYyB0byB0aGUgYnJvd3NlciBlbnZpcm9ubWVudCwgd2hpbGUgYEBhbmd1bGFyL3BsYXRmb3JtLXNlcnZlcmAgcHJvdmlkZXNcbiAqIG9uZSBzdWl0YWJsZSBmb3IgdXNlIHdpdGggc2VydmVyLXNpZGUgcmVuZGVyaW5nLlxuICpcbiAqIFRoZSBgUGxhdGZvcm1Mb2NhdGlvbmAgY2xhc3MgaXMgdXNlZCBkaXJlY3RseSBieSBhbGwgaW1wbGVtZW50YXRpb25zIG9mIHtAbGluayBMb2NhdGlvblN0cmF0ZWd5fVxuICogd2hlbiB0aGV5IG5lZWQgdG8gaW50ZXJhY3Qgd2l0aCB0aGUgRE9NIEFQSXMgbGlrZSBwdXNoU3RhdGUsIHBvcFN0YXRlLCBldGMuXG4gKlxuICoge0BsaW5rIExvY2F0aW9uU3RyYXRlZ3l9IGluIHR1cm4gaXMgdXNlZCBieSB0aGUge0BsaW5rIExvY2F0aW9ufSBzZXJ2aWNlIHdoaWNoIGlzIHVzZWQgZGlyZWN0bHlcbiAqIGJ5IHRoZSB7QGxpbmsgUm91dGVyfSBpbiBvcmRlciB0byBuYXZpZ2F0ZSBiZXR3ZWVuIHJvdXRlcy4gU2luY2UgYWxsIGludGVyYWN0aW9ucyBiZXR3ZWVuIHtAbGlua1xuICogUm91dGVyfSAvXG4gKiB7QGxpbmsgTG9jYXRpb259IC8ge0BsaW5rIExvY2F0aW9uU3RyYXRlZ3l9IGFuZCBET00gQVBJcyBmbG93IHRocm91Z2ggdGhlIGBQbGF0Zm9ybUxvY2F0aW9uYFxuICogY2xhc3MsIHRoZXkgYXJlIGFsbCBwbGF0Zm9ybS1hZ25vc3RpYy5cbiAqXG4gKiBAcHVibGljQXBpXG4gKi9cbkBJbmplY3RhYmxlKHtcbiAgcHJvdmlkZWRJbjogJ3BsYXRmb3JtJyxcbiAgLy8gU2VlICMyMzkxN1xuICB1c2VGYWN0b3J5OiB1c2VCcm93c2VyUGxhdGZvcm1Mb2NhdGlvblxufSlcbmV4cG9ydCBhYnN0cmFjdCBjbGFzcyBQbGF0Zm9ybUxvY2F0aW9uIHtcbiAgYWJzdHJhY3QgZ2V0QmFzZUhyZWZGcm9tRE9NKCk6IHN0cmluZztcbiAgYWJzdHJhY3QgZ2V0U3RhdGUoKTogdW5rbm93bjtcbiAgYWJzdHJhY3Qgb25Qb3BTdGF0ZShmbjogTG9jYXRpb25DaGFuZ2VMaXN0ZW5lcik6IHZvaWQ7XG4gIGFic3RyYWN0IG9uSGFzaENoYW5nZShmbjogTG9jYXRpb25DaGFuZ2VMaXN0ZW5lcik6IHZvaWQ7XG5cbiAgYWJzdHJhY3QgZ2V0IGhyZWYoKTogc3RyaW5nO1xuICBhYnN0cmFjdCBnZXQgcHJvdG9jb2woKTogc3RyaW5nO1xuICBhYnN0cmFjdCBnZXQgaG9zdG5hbWUoKTogc3RyaW5nO1xuICBhYnN0cmFjdCBnZXQgcG9ydCgpOiBzdHJpbmc7XG4gIGFic3RyYWN0IGdldCBwYXRobmFtZSgpOiBzdHJpbmc7XG4gIGFic3RyYWN0IGdldCBzZWFyY2goKTogc3RyaW5nO1xuICBhYnN0cmFjdCBnZXQgaGFzaCgpOiBzdHJpbmc7XG5cbiAgYWJzdHJhY3QgcmVwbGFjZVN0YXRlKHN0YXRlOiBhbnksIHRpdGxlOiBzdHJpbmcsIHVybDogc3RyaW5nKTogdm9pZDtcblxuICBhYnN0cmFjdCBwdXNoU3RhdGUoc3RhdGU6IGFueSwgdGl0bGU6IHN0cmluZywgdXJsOiBzdHJpbmcpOiB2b2lkO1xuXG4gIGFic3RyYWN0IGZvcndhcmQoKTogdm9pZDtcblxuICBhYnN0cmFjdCBiYWNrKCk6IHZvaWQ7XG59XG5cbmV4cG9ydCBmdW5jdGlvbiB1c2VCcm93c2VyUGxhdGZvcm1Mb2NhdGlvbigpIHtcbiAgcmV0dXJuIMm1ybVpbmplY3QoQnJvd3NlclBsYXRmb3JtTG9jYXRpb24pO1xufVxuXG4vKipcbiAqIEBkZXNjcmlwdGlvblxuICogSW5kaWNhdGVzIHdoZW4gYSBsb2NhdGlvbiBpcyBpbml0aWFsaXplZC5cbiAqXG4gKiBAcHVibGljQXBpXG4gKi9cbmV4cG9ydCBjb25zdCBMT0NBVElPTl9JTklUSUFMSVpFRCA9IG5ldyBJbmplY3Rpb25Ub2tlbjxQcm9taXNlPGFueT4+KCdMb2NhdGlvbiBJbml0aWFsaXplZCcpO1xuXG4vKipcbiAqIEBkZXNjcmlwdGlvblxuICogQSBzZXJpYWxpemFibGUgdmVyc2lvbiBvZiB0aGUgZXZlbnQgZnJvbSBgb25Qb3BTdGF0ZWAgb3IgYG9uSGFzaENoYW5nZWBcbiAqXG4gKiBAcHVibGljQXBpXG4gKi9cbmV4cG9ydCBpbnRlcmZhY2UgTG9jYXRpb25DaGFuZ2VFdmVudCB7XG4gIHR5cGU6IHN0cmluZztcbiAgc3RhdGU6IGFueTtcbn1cblxuLyoqXG4gKiBAcHVibGljQXBpXG4gKi9cbmV4cG9ydCBpbnRlcmZhY2UgTG9jYXRpb25DaGFuZ2VMaXN0ZW5lciB7XG4gIChldmVudDogTG9jYXRpb25DaGFuZ2VFdmVudCk6IGFueTtcbn1cblxuXG5cbi8qKlxuICogYFBsYXRmb3JtTG9jYXRpb25gIGVuY2Fwc3VsYXRlcyBhbGwgb2YgdGhlIGRpcmVjdCBjYWxscyB0byBwbGF0Zm9ybSBBUElzLlxuICogVGhpcyBjbGFzcyBzaG91bGQgbm90IGJlIHVzZWQgZGlyZWN0bHkgYnkgYW4gYXBwbGljYXRpb24gZGV2ZWxvcGVyLiBJbnN0ZWFkLCB1c2VcbiAqIHtAbGluayBMb2NhdGlvbn0uXG4gKi9cbkBJbmplY3RhYmxlKHtcbiAgcHJvdmlkZWRJbjogJ3BsYXRmb3JtJyxcbiAgLy8gU2VlICMyMzkxN1xuICB1c2VGYWN0b3J5OiBjcmVhdGVCcm93c2VyUGxhdGZvcm1Mb2NhdGlvbixcbn0pXG5leHBvcnQgY2xhc3MgQnJvd3NlclBsYXRmb3JtTG9jYXRpb24gZXh0ZW5kcyBQbGF0Zm9ybUxvY2F0aW9uIHtcbiAgcHVibGljIHJlYWRvbmx5IGxvY2F0aW9uITogTG9jYXRpb247XG4gIHByaXZhdGUgX2hpc3RvcnkhOiBIaXN0b3J5O1xuXG4gIGNvbnN0cnVjdG9yKEBJbmplY3QoRE9DVU1FTlQpIHByaXZhdGUgX2RvYzogYW55KSB7XG4gICAgc3VwZXIoKTtcbiAgICB0aGlzLl9pbml0KCk7XG4gIH1cblxuICAvLyBUaGlzIGlzIG1vdmVkIHRvIGl0cyBvd24gbWV0aG9kIHNvIHRoYXQgYE1vY2tQbGF0Zm9ybUxvY2F0aW9uU3RyYXRlZ3lgIGNhbiBvdmVyd3JpdGUgaXRcbiAgLyoqIEBpbnRlcm5hbCAqL1xuICBfaW5pdCgpIHtcbiAgICAodGhpcyBhcyB7bG9jYXRpb246IExvY2F0aW9ufSkubG9jYXRpb24gPSBnZXRET00oKS5nZXRMb2NhdGlvbigpO1xuICAgIHRoaXMuX2hpc3RvcnkgPSBnZXRET00oKS5nZXRIaXN0b3J5KCk7XG4gIH1cblxuICBnZXRCYXNlSHJlZkZyb21ET00oKTogc3RyaW5nIHtcbiAgICByZXR1cm4gZ2V0RE9NKCkuZ2V0QmFzZUhyZWYodGhpcy5fZG9jKSE7XG4gIH1cblxuICBvblBvcFN0YXRlKGZuOiBMb2NhdGlvbkNoYW5nZUxpc3RlbmVyKTogdm9pZCB7XG4gICAgZ2V0RE9NKCkuZ2V0R2xvYmFsRXZlbnRUYXJnZXQodGhpcy5fZG9jLCAnd2luZG93JykuYWRkRXZlbnRMaXN0ZW5lcigncG9wc3RhdGUnLCBmbiwgZmFsc2UpO1xuICB9XG5cbiAgb25IYXNoQ2hhbmdlKGZuOiBMb2NhdGlvbkNoYW5nZUxpc3RlbmVyKTogdm9pZCB7XG4gICAgZ2V0RE9NKCkuZ2V0R2xvYmFsRXZlbnRUYXJnZXQodGhpcy5fZG9jLCAnd2luZG93JykuYWRkRXZlbnRMaXN0ZW5lcignaGFzaGNoYW5nZScsIGZuLCBmYWxzZSk7XG4gIH1cblxuICBnZXQgaHJlZigpOiBzdHJpbmcge1xuICAgIHJldHVybiB0aGlzLmxvY2F0aW9uLmhyZWY7XG4gIH1cbiAgZ2V0IHByb3RvY29sKCk6IHN0cmluZyB7XG4gICAgcmV0dXJuIHRoaXMubG9jYXRpb24ucHJvdG9jb2w7XG4gIH1cbiAgZ2V0IGhvc3RuYW1lKCk6IHN0cmluZyB7XG4gICAgcmV0dXJuIHRoaXMubG9jYXRpb24uaG9zdG5hbWU7XG4gIH1cbiAgZ2V0IHBvcnQoKTogc3RyaW5nIHtcbiAgICByZXR1cm4gdGhpcy5sb2NhdGlvbi5wb3J0O1xuICB9XG4gIGdldCBwYXRobmFtZSgpOiBzdHJpbmcge1xuICAgIHJldHVybiB0aGlzLmxvY2F0aW9uLnBhdGhuYW1lO1xuICB9XG4gIGdldCBzZWFyY2goKTogc3RyaW5nIHtcbiAgICByZXR1cm4gdGhpcy5sb2NhdGlvbi5zZWFyY2g7XG4gIH1cbiAgZ2V0IGhhc2goKTogc3RyaW5nIHtcbiAgICByZXR1cm4gdGhpcy5sb2NhdGlvbi5oYXNoO1xuICB9XG4gIHNldCBwYXRobmFtZShuZXdQYXRoOiBzdHJpbmcpIHtcbiAgICB0aGlzLmxvY2F0aW9uLnBhdGhuYW1lID0gbmV3UGF0aDtcbiAgfVxuXG4gIHB1c2hTdGF0ZShzdGF0ZTogYW55LCB0aXRsZTogc3RyaW5nLCB1cmw6IHN0cmluZyk6IHZvaWQge1xuICAgIGlmIChzdXBwb3J0c1N0YXRlKCkpIHtcbiAgICAgIHRoaXMuX2hpc3RvcnkucHVzaFN0YXRlKHN0YXRlLCB0aXRsZSwgdXJsKTtcbiAgICB9IGVsc2Uge1xuICAgICAgdGhpcy5sb2NhdGlvbi5oYXNoID0gdXJsO1xuICAgIH1cbiAgfVxuXG4gIHJlcGxhY2VTdGF0ZShzdGF0ZTogYW55LCB0aXRsZTogc3RyaW5nLCB1cmw6IHN0cmluZyk6IHZvaWQge1xuICAgIGlmIChzdXBwb3J0c1N0YXRlKCkpIHtcbiAgICAgIHRoaXMuX2hpc3RvcnkucmVwbGFjZVN0YXRlKHN0YXRlLCB0aXRsZSwgdXJsKTtcbiAgICB9IGVsc2Uge1xuICAgICAgdGhpcy5sb2NhdGlvbi5oYXNoID0gdXJsO1xuICAgIH1cbiAgfVxuXG4gIGZvcndhcmQoKTogdm9pZCB7XG4gICAgdGhpcy5faGlzdG9yeS5mb3J3YXJkKCk7XG4gIH1cblxuICBiYWNrKCk6IHZvaWQge1xuICAgIHRoaXMuX2hpc3RvcnkuYmFjaygpO1xuICB9XG5cbiAgZ2V0U3RhdGUoKTogdW5rbm93biB7XG4gICAgcmV0dXJuIHRoaXMuX2hpc3Rvcnkuc3RhdGU7XG4gIH1cbn1cblxuZXhwb3J0IGZ1bmN0aW9uIHN1cHBvcnRzU3RhdGUoKTogYm9vbGVhbiB7XG4gIHJldHVybiAhIXdpbmRvdy5oaXN0b3J5LnB1c2hTdGF0ZTtcbn1cbmV4cG9ydCBmdW5jdGlvbiBjcmVhdGVCcm93c2VyUGxhdGZvcm1Mb2NhdGlvbigpIHtcbiAgcmV0dXJuIG5ldyBCcm93c2VyUGxhdGZvcm1Mb2NhdGlvbijJtcm1aW5qZWN0KERPQ1VNRU5UKSk7XG59XG4iXX0=