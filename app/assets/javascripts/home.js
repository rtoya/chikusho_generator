$(document).ready(function(){
  $('.flame_thumb').on('click', function(){
    var _self = $(this);
    _self.closest('div.row').find('a.selected').removeClass('selected');
    _self.addClass('selected');
    var flame_id = _self.attr("id").replace(/flame/g, '');
    var next_btn = $('a.next_btn');
    next_btn.attr('href', '/adjust_photo?fid=' + flame_id);
    next_btn.removeAttr('disabled');
  });
});
