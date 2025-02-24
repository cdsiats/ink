<script>
  import StyleSet from '@stackpress/ink/dist/style/StyleSet';
  import setBold from '../utilities/style/bold';
  import setColor from '../utilities/style/color';
  import setDisplay from '../utilities/style/display';
  import setSize from '../utilities/style/size';
  import setUnderline from '../utilities/style/underline';
  //extract props
  const { 
    value, label,
    //dont need these...
    'class': _, style,
    //the rest is for the link
    ...attributes
  } = this.props;
  //override default styles
  const styles = new StyleSet();
  this.styles = () => styles.toString();
  //determine host display
  setDisplay(this.props, styles, 'inline-block', ':host');
  //determine size
  setSize(this.props, styles, '13px', ':host', 'font-size');
  //determine font weight
  setBold(this.props, styles, ':host');
  //determine color
  setColor(this.props, styles, false, 'a', 'color');
  //determine text decoration
  setUnderline(this.props, styles, 'a');
</script>
<a {...attributes} href={`tel:${value}`}>{label || value}</a>