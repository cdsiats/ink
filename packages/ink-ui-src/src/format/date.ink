<script>
  import StyleSet from '@stackpress/ink/dist/style/StyleSet';
  import relativeTime from 'dayjs/plugin/relativeTime';
  import dayjs from 'dayjs';
  import setBold from '../utilities/style/bold';
  import setColor from '../utilities/style/color';
  import setDisplay from '../utilities/style/display';
  import setSize from '../utilities/style/size';
  //dayjs configuration
  dayjs.extend(relativeTime);
  dayjs.locale('short', { 
    parentLocale: 'en',
    relativeTime: { 
      future: "-%s",  past: "%s", s: 'now', ss: 'now',
      m: "1m",        mm: "%dm",  h:  "1h", hh: "%dh",
      d: "1d",        dd: "%dd",  w:  "1w", ww: "%dw",
      M: "1M",        MM: "%dM",  y:  "1y", yy: "%dy"
    }
  });
  //extract props
  const { 
    value, 
    locale = 'en',
    format = 'MMMM D, YYYY, h:mm:ss a'
  } = this.props;
  //override default styles
  const styles = new StyleSet();
  this.styles = () => styles.toString();
  //determine display
  setDisplay(this.props, styles, 'inline-block');
  //determine color
  setColor(this.props, styles, false, ':host', 'color');
  //determine size
  setSize(this.props, styles, false, ':host', 'font-size');
  //determine font weight
  setBold(this.props, styles, ':host');
  //make date object
  const date = value ? new Date(value): new Date();
  //format date
  const output = format === 'ago' 
    ? dayjs(date).locale(locale).fromNow()
    : format === 'a'
    ? dayjs(date).locale('short').fromNow()
    : dayjs(date).locale(locale).format(format);
</script>
{output}