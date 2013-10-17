var photo_original_width = 0;
var photo_original_height = 0;

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
  photo_original_width = $('#jcrop_target').width();
  photo_original_height = $('#jcrop_target').height();
  var rx = 420 / coords.w;
  var ry = 350 / coords.h;
  $('.preview').css({
    width: Math.round(rx * photo_original_width) + 'px',
    height: Math.round(ry * photo_original_height) + 'px',
    marginLeft: '-' + Math.round(rx * coords.x) + 'px',
    marginTop: '-' + Math.round(ry * coords.y) + 'px'
  });
}
$(function() {
  $('.tweet').socialbutton('twitter', {
    button: 'horizontal',
    text: 'ツイートに含むテキスト'
  });
});
$(function() {
  $('.google_plusone').socialbutton('google_plusone');
});
$(function() {
  $('.facebook_like').socialbutton('facebook_like');
});
$(function() {
  $('.hatena').socialbutton('hatena');
});