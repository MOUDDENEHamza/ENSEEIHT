/**
 * @license
 * Copyright Google LLC All Rights Reserved.
 *
 * Use of this source code is governed by an MIT-style license that can be
 * found in the LICENSE file at https://angular.io/license
 */
import { NgModule } from '@angular/core';
import { COMMON_DIRECTIVES } from './directives/index';
import { NgLocaleLocalization, NgLocalization } from './i18n/localization';
import { COMMON_PIPES } from './pipes/index';
// Note: This does not contain the location providers,
// as they need some platform specific implementations to work.
/**
 * Exports all the basic Angular directives and pipes,
 * such as `NgIf`, `NgForOf`, `DecimalPipe`, and so on.
 * Re-exported by `BrowserModule`, which is included automatically in the root
 * `AppModule` when you create a new app with the CLI `new` command.
 *
 * * The `providers` options configure the NgModule's injector to provide
 * localization dependencies to members.
 * * The `exports` options make the declared directives and pipes available for import
 * by other NgModules.
 *
 * @publicApi
 */
import * as ɵngcc0 from '@angular/core';
import * as ɵngcc1 from './directives/ng_class';
import * as ɵngcc2 from './directives/ng_component_outlet';
import * as ɵngcc3 from './directives/ng_for_of';
import * as ɵngcc4 from './directives/ng_if';
import * as ɵngcc5 from './directives/ng_template_outlet';
import * as ɵngcc6 from './directives/ng_style';
import * as ɵngcc7 from './directives/ng_switch';
import * as ɵngcc8 from './directives/ng_plural';
import * as ɵngcc9 from './pipes/async_pipe';
import * as ɵngcc10 from './pipes/case_conversion_pipes';
import * as ɵngcc11 from './pipes/json_pipe';
import * as ɵngcc12 from './pipes/slice_pipe';
import * as ɵngcc13 from './pipes/number_pipe';
import * as ɵngcc14 from './pipes/date_pipe';
import * as ɵngcc15 from './pipes/i18n_plural_pipe';
import * as ɵngcc16 from './pipes/i18n_select_pipe';
import * as ɵngcc17 from './pipes/keyvalue_pipe';
export class CommonModule {
}
CommonModule.ɵmod = ɵngcc0.ɵɵdefineNgModule({ type: CommonModule });
CommonModule.ɵinj = ɵngcc0.ɵɵdefineInjector({ factory: function CommonModule_Factory(t) { return new (t || CommonModule)(); }, providers: [
        { provide: NgLocalization, useClass: NgLocaleLocalization },
    ] });
(function () { (typeof ngJitMode === "undefined" || ngJitMode) && ɵngcc0.ɵɵsetNgModuleScope(CommonModule, { declarations: [ɵngcc1.NgClass, ɵngcc2.NgComponentOutlet, ɵngcc3.NgForOf, ɵngcc4.NgIf, ɵngcc5.NgTemplateOutlet, ɵngcc6.NgStyle, ɵngcc7.NgSwitch, ɵngcc7.NgSwitchCase, ɵngcc7.NgSwitchDefault, ɵngcc8.NgPlural, ɵngcc8.NgPluralCase, ɵngcc9.AsyncPipe, ɵngcc10.UpperCasePipe, ɵngcc10.LowerCasePipe, ɵngcc11.JsonPipe, ɵngcc12.SlicePipe, ɵngcc13.DecimalPipe, ɵngcc13.PercentPipe, ɵngcc10.TitleCasePipe, ɵngcc13.CurrencyPipe, ɵngcc14.DatePipe, ɵngcc15.I18nPluralPipe, ɵngcc16.I18nSelectPipe, ɵngcc17.KeyValuePipe], exports: [ɵngcc1.NgClass, ɵngcc2.NgComponentOutlet, ɵngcc3.NgForOf, ɵngcc4.NgIf, ɵngcc5.NgTemplateOutlet, ɵngcc6.NgStyle, ɵngcc7.NgSwitch, ɵngcc7.NgSwitchCase, ɵngcc7.NgSwitchDefault, ɵngcc8.NgPlural, ɵngcc8.NgPluralCase, ɵngcc9.AsyncPipe, ɵngcc10.UpperCasePipe, ɵngcc10.LowerCasePipe, ɵngcc11.JsonPipe, ɵngcc12.SlicePipe, ɵngcc13.DecimalPipe, ɵngcc13.PercentPipe, ɵngcc10.TitleCasePipe, ɵngcc13.CurrencyPipe, ɵngcc14.DatePipe, ɵngcc15.I18nPluralPipe, ɵngcc16.I18nSelectPipe, ɵngcc17.KeyValuePipe] }); })();
/*@__PURE__*/ (function () { ɵngcc0.ɵsetClassMetadata(CommonModule, [{
        type: NgModule,
        args: [{
                declarations: [COMMON_DIRECTIVES, COMMON_PIPES],
                exports: [COMMON_DIRECTIVES, COMMON_PIPES],
                providers: [
                    { provide: NgLocalization, useClass: NgLocaleLocalization },
                ]
            }]
    }], null, null); })();

//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiY29tbW9uX21vZHVsZS5qcyIsInNvdXJjZXMiOlsiLi4vLi4vLi4vLi4vLi4vLi4vcGFja2FnZXMvY29tbW9uL3NyYy9jb21tb25fbW9kdWxlLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEdBQUc7QUFFSCxPQUFPLEVBQUMsUUFBUSxFQUFDLE1BQU0sZUFBZSxDQUFDO0FBQ3ZDLE9BQU8sRUFBQyxpQkFBaUIsRUFBQyxNQUFNLG9CQUFvQixDQUFDO0FBQ3JELE9BQU8sRUFBQyxvQkFBb0IsRUFBRSxjQUFjLEVBQUMsTUFBTSxxQkFBcUIsQ0FBQztBQUN6RSxPQUFPLEVBQUMsWUFBWSxFQUFDLE1BQU0sZUFBZSxDQUFDO0FBRzNDLHNEQUFzRDtBQUN0RCwrREFBK0Q7QUFDL0Q7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsR0FBRzs7Ozs7Ozs7Ozs7Ozs7Ozs7OztBQVFILE1BQU0sT0FBTyxZQUFZO0FBQ3pCO3dDQVJDLFFBQVEsU0FBQztNQUNSLFlBQVksRUFBRSxDQUFDLGlCQUFpQixFQUFFLFlBQVksQ0FBQyxrQkFDL0MsT0FBTyxFQUFFLENBQUMsaUJBQWlCLEVBQUUsWUFBWSxDQUFDLGtCQUMxQztBQUFTLEVBQUUsc0JBQ1QsRUFBQyxPQUFPLEVBQUUsY0FBYyxFQUFFLFFBQVEsRUFBRTs7RUFBb0IsRUFBQyxtQkFDMUQsZUFDRjs7Ozs7Ozs7OzswQkFDSTtBQUFDIiwic291cmNlc0NvbnRlbnQiOlsiLyoqXG4gKiBAbGljZW5zZVxuICogQ29weXJpZ2h0IEdvb2dsZSBMTEMgQWxsIFJpZ2h0cyBSZXNlcnZlZC5cbiAqXG4gKiBVc2Ugb2YgdGhpcyBzb3VyY2UgY29kZSBpcyBnb3Zlcm5lZCBieSBhbiBNSVQtc3R5bGUgbGljZW5zZSB0aGF0IGNhbiBiZVxuICogZm91bmQgaW4gdGhlIExJQ0VOU0UgZmlsZSBhdCBodHRwczovL2FuZ3VsYXIuaW8vbGljZW5zZVxuICovXG5cbmltcG9ydCB7TmdNb2R1bGV9IGZyb20gJ0Bhbmd1bGFyL2NvcmUnO1xuaW1wb3J0IHtDT01NT05fRElSRUNUSVZFU30gZnJvbSAnLi9kaXJlY3RpdmVzL2luZGV4JztcbmltcG9ydCB7TmdMb2NhbGVMb2NhbGl6YXRpb24sIE5nTG9jYWxpemF0aW9ufSBmcm9tICcuL2kxOG4vbG9jYWxpemF0aW9uJztcbmltcG9ydCB7Q09NTU9OX1BJUEVTfSBmcm9tICcuL3BpcGVzL2luZGV4JztcblxuXG4vLyBOb3RlOiBUaGlzIGRvZXMgbm90IGNvbnRhaW4gdGhlIGxvY2F0aW9uIHByb3ZpZGVycyxcbi8vIGFzIHRoZXkgbmVlZCBzb21lIHBsYXRmb3JtIHNwZWNpZmljIGltcGxlbWVudGF0aW9ucyB0byB3b3JrLlxuLyoqXG4gKiBFeHBvcnRzIGFsbCB0aGUgYmFzaWMgQW5ndWxhciBkaXJlY3RpdmVzIGFuZCBwaXBlcyxcbiAqIHN1Y2ggYXMgYE5nSWZgLCBgTmdGb3JPZmAsIGBEZWNpbWFsUGlwZWAsIGFuZCBzbyBvbi5cbiAqIFJlLWV4cG9ydGVkIGJ5IGBCcm93c2VyTW9kdWxlYCwgd2hpY2ggaXMgaW5jbHVkZWQgYXV0b21hdGljYWxseSBpbiB0aGUgcm9vdFxuICogYEFwcE1vZHVsZWAgd2hlbiB5b3UgY3JlYXRlIGEgbmV3IGFwcCB3aXRoIHRoZSBDTEkgYG5ld2AgY29tbWFuZC5cbiAqXG4gKiAqIFRoZSBgcHJvdmlkZXJzYCBvcHRpb25zIGNvbmZpZ3VyZSB0aGUgTmdNb2R1bGUncyBpbmplY3RvciB0byBwcm92aWRlXG4gKiBsb2NhbGl6YXRpb24gZGVwZW5kZW5jaWVzIHRvIG1lbWJlcnMuXG4gKiAqIFRoZSBgZXhwb3J0c2Agb3B0aW9ucyBtYWtlIHRoZSBkZWNsYXJlZCBkaXJlY3RpdmVzIGFuZCBwaXBlcyBhdmFpbGFibGUgZm9yIGltcG9ydFxuICogYnkgb3RoZXIgTmdNb2R1bGVzLlxuICpcbiAqIEBwdWJsaWNBcGlcbiAqL1xuQE5nTW9kdWxlKHtcbiAgZGVjbGFyYXRpb25zOiBbQ09NTU9OX0RJUkVDVElWRVMsIENPTU1PTl9QSVBFU10sXG4gIGV4cG9ydHM6IFtDT01NT05fRElSRUNUSVZFUywgQ09NTU9OX1BJUEVTXSxcbiAgcHJvdmlkZXJzOiBbXG4gICAge3Byb3ZpZGU6IE5nTG9jYWxpemF0aW9uLCB1c2VDbGFzczogTmdMb2NhbGVMb2NhbGl6YXRpb259LFxuICBdLFxufSlcbmV4cG9ydCBjbGFzcyBDb21tb25Nb2R1bGUge1xufVxuIl19