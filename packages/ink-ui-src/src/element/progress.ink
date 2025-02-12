<script observe="width">
  import type { AttributeChangeEvent } from '@stackpress/ink/dist/types';
  import StyleSet from '@stackpress/ink/dist/style/StyleSet';
  import setColor from '../utilities/style/color';
  import setDisplay from '../utilities/style/display';
  //define handlers
  const { width = 0, height = 20, bg } = this.propsTree;
  //override default styles
  const styles = new StyleSet();
  this.styles = () => styles.toString();
  //get the children
  const children = this.originalChildren;
  //default host styles
  styles.add(':host', 'position', 'relative');
  styles.add(':host', 'overflow', 'hidden');
  styles.add(':host', 'height', `${height}px`);
  //determine display
  setDisplay(this.props, styles, 'block', ':host');
  //determine bar styles
  styles.add('.bar', 'height', '100%');
  if (!isNaN(Number(width))) {
    styles.add('.bar', 'width', `${Math.min(
      Math.max(Number(width), 0), 
      100
    )}%`);
  }
  styles.add('.bar', 'transition', 'width 500ms');
  //determine color
  if (bg) {
    setColor(bg, styles, false, ':host', 'background-color');
  }
  setColor(this.props, styles, false, '.bar', 'background-color');
  //determine label styles
  styles.add('.label', 'position', 'absolute');
  styles.add('.label', 'top', '0');
  styles.add('.label', 'bottom', '0');
  styles.add('.label', 'left', '0');
  styles.add('.label', 'right', '0');
  styles.add('.label', 'display', 'flex');
  styles.add('.label', 'align-items', 'center');
  styles.add('.label', 'justify-content', 'center');
  styles.add('.label', 'text-align', 'center');
  //watch for width changes
  this.on('attributechange', (e: AttributeChangeEvent) => {
    //accepts: width only
    const { action, name, value, target } = e.detail;
    if (name !== 'width') return;
    const bar = target.shadowRoot?.querySelector('div.bar');
    if (!bar) return;
    if (action === 'remove') {
      bar.style.width = '0%';
      return;
    }
    if (isNaN(parseFloat(value))) return;
    bar.style.width = `${Math.min(
      Math.max(parseFloat(value), 0), 
      100
    )}%`;
  });
</script>
<div class="bar"></div>
<if true={children.length}>
  <div class="label"><slot></slot></div>
</if>