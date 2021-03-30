/**
 * @license
 * Copyright Google LLC All Rights Reserved.
 *
 * Use of this source code is governed by an MIT-style license that can be
 * found in the LICENSE file at https://angular.io/license
 */
import { DOCUMENT, ɵgetDOM as getDOM } from '@angular/common';
import { Inject, Injectable } from '@angular/core';
import { TestComponentRenderer } from '@angular/core/testing';
/**
 * A DOM based implementation of the TestComponentRenderer.
 */
import * as ɵngcc0 from '@angular/core';
export class DOMTestComponentRenderer extends TestComponentRenderer {
    constructor(_doc) {
        super();
        this._doc = _doc;
    }
    insertRootElement(rootElId) {
        const template = getDOM().getDefaultDocument().createElement('template');
        template.innerHTML = `<div id="${rootElId}"></div>`;
        const rootEl = getContent(template).firstChild;
        // TODO(juliemr): can/should this be optional?
        const oldRoots = this._doc.querySelectorAll('[id^=root]');
        for (let i = 0; i < oldRoots.length; i++) {
            getDOM().remove(oldRoots[i]);
        }
        this._doc.body.appendChild(rootEl);
    }
}
DOMTestComponentRenderer.ɵfac = function DOMTestComponentRenderer_Factory(t) { return new (t || DOMTestComponentRenderer)(ɵngcc0.ɵɵinject(DOCUMENT)); };
DOMTestComponentRenderer.ɵprov = ɵngcc0.ɵɵdefineInjectable({ token: DOMTestComponentRenderer, factory: DOMTestComponentRenderer.ɵfac });
DOMTestComponentRenderer.ctorParameters = () => [
    { type: undefined, decorators: [{ type: Inject, args: [DOCUMENT,] }] }
];
/*@__PURE__*/ (function () { ɵngcc0.ɵsetClassMetadata(DOMTestComponentRenderer, [{
        type: Injectable
    }], function () { return [{ type: undefined, decorators: [{
                type: Inject,
                args: [DOCUMENT]
            }] }]; }, null); })();
function getContent(node) {
    if ('content' in node) {
        return node.content;
    }
    else {
        return node;
    }
}

//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZG9tX3Rlc3RfY29tcG9uZW50X3JlbmRlcmVyLmpzIiwic291cmNlcyI6WyIuLi8uLi8uLi8uLi8uLi8uLi8uLi9wYWNrYWdlcy9wbGF0Zm9ybS1icm93c2VyLWR5bmFtaWMvdGVzdGluZy9zcmMvZG9tX3Rlc3RfY29tcG9uZW50X3JlbmRlcmVyLnRzIl0sIm5hbWVzIjpbXSwibWFwcGluZ3MiOiJBQUFBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBLEdBQUc7QUFFSCxPQUFPLEVBQUMsUUFBUSxFQUFFLE9BQU8sSUFBSSxNQUFNLEVBQUMsTUFBTSxpQkFBaUIsQ0FBQztBQUM1RCxPQUFPLEVBQUMsTUFBTSxFQUFFLFVBQVUsRUFBQyxNQUFNLGVBQWUsQ0FBQztBQUNqRCxPQUFPLEVBQUMscUJBQXFCLEVBQUMsTUFBTSx1QkFBdUIsQ0FBQztBQUU1RDtBQUNBO0FBQ0EsR0FBRzs7QUFFSCxNQUFNLE9BQU8sd0JBQXlCLFNBQVEscUJBQXFCO0FBQ25FLElBQUUsWUFBc0MsSUFBUztBQUNqRCxRQUFJLEtBQUssRUFBRSxDQUFDO0FBQ1osUUFGd0MsU0FBSSxHQUFKLElBQUksQ0FBSztBQUFDLElBRWhELENBQUM7QUFDSCxJQUNFLGlCQUFpQixDQUFDLFFBQWdCO0FBQ3BDLFFBQUksTUFBTSxRQUFRLEdBQUcsTUFBTSxFQUFFLENBQUMsa0JBQWtCLEVBQUUsQ0FBQyxhQUFhLENBQUMsVUFBVSxDQUFDLENBQUM7QUFDN0UsUUFBSSxRQUFRLENBQUMsU0FBUyxHQUFHLFlBQVksUUFBUSxVQUFVLENBQUM7QUFDeEQsUUFBSSxNQUFNLE1BQU0sR0FBZ0IsVUFBVSxDQUFDLFFBQVEsQ0FBQyxDQUFDLFVBQVUsQ0FBQztBQUNoRSxRQUNJLDhDQUE4QztBQUNsRCxRQUFJLE1BQU0sUUFBUSxHQUFHLElBQUksQ0FBQyxJQUFJLENBQUMsZ0JBQWdCLENBQUMsWUFBWSxDQUFDLENBQUM7QUFDOUQsUUFBSSxLQUFLLElBQUksQ0FBQyxHQUFHLENBQUMsRUFBRSxDQUFDLEdBQUcsUUFBUSxDQUFDLE1BQU0sRUFBRSxDQUFDLEVBQUUsRUFBRTtBQUM5QyxZQUFNLE1BQU0sRUFBRSxDQUFDLE1BQU0sQ0FBQyxRQUFRLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQztBQUNuQyxTQUFLO0FBQ0wsUUFBSSxJQUFJLENBQUMsSUFBSSxDQUFDLElBQUksQ0FBQyxXQUFXLENBQUMsTUFBTSxDQUFDLENBQUM7QUFDdkMsSUFBRSxDQUFDO0FBQ0g7b0RBbEJDLFVBQVU7d0lBQ1Q7QUFBQztBQUFrRCw0Q0FDdEMsTUFBTSxTQUFDLFFBQVE7QUFBUTs7Ozs7O2tDQUFFO0FBa0J4QyxTQUFTLFVBQVUsQ0FBQyxJQUFVO0FBQUksSUFDaEMsSUFBSSxTQUFTLElBQUksSUFBSSxFQUFFO0FBQ3pCLFFBQUksT0FBYSxJQUFLLENBQUMsT0FBTyxDQUFDO0FBQy9CLEtBQUc7QUFBQyxTQUFLO0FBQ1QsUUFBSSxPQUFPLElBQUksQ0FBQztBQUNoQixLQUFHO0FBQ0gsQ0FBQztBQUNEIiwic291cmNlc0NvbnRlbnQiOlsiLyoqXG4gKiBAbGljZW5zZVxuICogQ29weXJpZ2h0IEdvb2dsZSBMTEMgQWxsIFJpZ2h0cyBSZXNlcnZlZC5cbiAqXG4gKiBVc2Ugb2YgdGhpcyBzb3VyY2UgY29kZSBpcyBnb3Zlcm5lZCBieSBhbiBNSVQtc3R5bGUgbGljZW5zZSB0aGF0IGNhbiBiZVxuICogZm91bmQgaW4gdGhlIExJQ0VOU0UgZmlsZSBhdCBodHRwczovL2FuZ3VsYXIuaW8vbGljZW5zZVxuICovXG5cbmltcG9ydCB7RE9DVU1FTlQsIMm1Z2V0RE9NIGFzIGdldERPTX0gZnJvbSAnQGFuZ3VsYXIvY29tbW9uJztcbmltcG9ydCB7SW5qZWN0LCBJbmplY3RhYmxlfSBmcm9tICdAYW5ndWxhci9jb3JlJztcbmltcG9ydCB7VGVzdENvbXBvbmVudFJlbmRlcmVyfSBmcm9tICdAYW5ndWxhci9jb3JlL3Rlc3RpbmcnO1xuXG4vKipcbiAqIEEgRE9NIGJhc2VkIGltcGxlbWVudGF0aW9uIG9mIHRoZSBUZXN0Q29tcG9uZW50UmVuZGVyZXIuXG4gKi9cbkBJbmplY3RhYmxlKClcbmV4cG9ydCBjbGFzcyBET01UZXN0Q29tcG9uZW50UmVuZGVyZXIgZXh0ZW5kcyBUZXN0Q29tcG9uZW50UmVuZGVyZXIge1xuICBjb25zdHJ1Y3RvcihASW5qZWN0KERPQ1VNRU5UKSBwcml2YXRlIF9kb2M6IGFueSkge1xuICAgIHN1cGVyKCk7XG4gIH1cblxuICBpbnNlcnRSb290RWxlbWVudChyb290RWxJZDogc3RyaW5nKSB7XG4gICAgY29uc3QgdGVtcGxhdGUgPSBnZXRET00oKS5nZXREZWZhdWx0RG9jdW1lbnQoKS5jcmVhdGVFbGVtZW50KCd0ZW1wbGF0ZScpO1xuICAgIHRlbXBsYXRlLmlubmVySFRNTCA9IGA8ZGl2IGlkPVwiJHtyb290RWxJZH1cIj48L2Rpdj5gO1xuICAgIGNvbnN0IHJvb3RFbCA9IDxIVE1MRWxlbWVudD5nZXRDb250ZW50KHRlbXBsYXRlKS5maXJzdENoaWxkO1xuXG4gICAgLy8gVE9ETyhqdWxpZW1yKTogY2FuL3Nob3VsZCB0aGlzIGJlIG9wdGlvbmFsP1xuICAgIGNvbnN0IG9sZFJvb3RzID0gdGhpcy5fZG9jLnF1ZXJ5U2VsZWN0b3JBbGwoJ1tpZF49cm9vdF0nKTtcbiAgICBmb3IgKGxldCBpID0gMDsgaSA8IG9sZFJvb3RzLmxlbmd0aDsgaSsrKSB7XG4gICAgICBnZXRET00oKS5yZW1vdmUob2xkUm9vdHNbaV0pO1xuICAgIH1cbiAgICB0aGlzLl9kb2MuYm9keS5hcHBlbmRDaGlsZChyb290RWwpO1xuICB9XG59XG5cbmZ1bmN0aW9uIGdldENvbnRlbnQobm9kZTogTm9kZSk6IE5vZGUge1xuICBpZiAoJ2NvbnRlbnQnIGluIG5vZGUpIHtcbiAgICByZXR1cm4gKDxhbnk+bm9kZSkuY29udGVudDtcbiAgfSBlbHNlIHtcbiAgICByZXR1cm4gbm9kZTtcbiAgfVxufVxuIl19