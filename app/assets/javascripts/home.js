var photo_display_width = 0;
var photo_display_height = 0;

$(function(){
  $('.flame_thumb').on('click', function(){
    var _self = $(this);
    _self.closest('div.row').find('a.selected').removeClass('selected');
    _self.addClass('selected');
    var flame_id = _self.attr("id").replace(/flame/g, '');
    var next_btn = $('input.next_btn');
    $('input#flame_id').val(flame_id);
    next_btn.removeAttr('disabled');
  });

  $('#jcrop_target').Jcrop({
    aspectRatio: 1.2,
    minSize: [30, 25],
    onSelect: showPreview,
    onChange: showPreview
  });
});
var showPreview = function(coords){
  photo_display_width = $('#jcrop_target').width();
  photo_display_height = $('#jcrop_target').height();
  var rx = 420 / coords.w;
  var ry = 350 / coords.h;
  $('.preview').css({
    width: Math.round(rx * photo_display_width) + 'px',
    height: Math.round(ry * photo_display_height) + 'px',
    marginLeft: '-' + Math.round(rx * coords.x) + 'px',
    marginTop: '-' + Math.round(ry * coords.y) + 'px'
  });

  var photo_original_width = document.getElementById('jcrop_target').naturalWidth;
  var display_ratio = photo_original_width / photo_display_width;

  $('#coords_w').val(coords.w * display_ratio);
  $('#coords_h').val(coords.h * display_ratio);
  $('#coords_x').val(coords.x * display_ratio);
  $('#coords_y').val(coords.y * display_ratio);
}
$(function() {
  $('.tweet').socialbutton('twitter', {
    button: 'horizontal',
    text: 'ちくしょう。ジェネレーターで遊んでみた！'
  });
});
$(function() {
  $('.google_plusone').socialbutton('google_plusone');
});
$(function() {
  $('.facebook_like').socialbutton('facebook_like', { button: 'button_count' });
});
$(function() {
  $('.hatena').socialbutton('hatena');
});
