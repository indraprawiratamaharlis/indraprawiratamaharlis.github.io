<?php 
/*     Tempest EPG Generator (made by Kvanc)
https://github.com/K-vanc/Tempest-EPG-Generator.git  */
return array (
  'filename' => 'dummy[weekly]',
  'creator_name' => 'Kivanc',
  'creation_date' => '2023-10-08',
  'rev_no' => 'R0',
  'remarks' => 'Weekly Siteconfig for Dummy Channel(s)',
  'timezone' => '##usertime##',
  'culture' => 'en',
  'max_day' => '7.1',
  'first_day' => '0123456',
  'episodeOption' => '1',
  'keepindexpage' => 'on',
  'url1' => 'https://indraprawiratamaharlis.github.io/dummy.json',
  'requestOption1' => '1',
  'show' => '"channelId":"##channel##".*?,"day\\d":\\[.*?(?:{)(.*?)(?:}).*?\\]',
  'start' => '"start":"(.*?)"',
  'start_format' => 'H#i',
  'stop' => '"stop":"(.*?)"',
  'stop_format' => 'H#i',
  'title' => '"title":"(.*?)","',
  'subtitle' => '"subtitle":"(.*?)","',
  'desc' => '"description":"(.*?)","',
  'category' => '"genre":"(.*?)",||#split#(,)',
  'showicon' => '"showicon":"(.*?)"',
  'season' => '"season":"(\\d+)',
  'episode' => '"episode":"(\\d+)',
  'channel_logo' => '"channelId":"##channel##","logo":"(.*?)"',
  'production_date' => '"year":"(\\d{4})',
  'actor' => '"actor":"(.*?)",||#split#(,)',
  'director' => '"director":"(.*?)",||#split#(,)',
  'producer' => '"producer":"(.*?)",||#split#(,)',
  'writer' => '"writer":"(.*?)",||#split#(,)',
  'country' => '"country":"(.*?)"||#split#(,)',
  'rating' => '"rating":"(.*?)"',
  'ccurl1' => 'https://indraprawiratamaharlis.github.io/dummy.json',
  'ccrequestOption1' => '1',
  'ccchannel_block' => '{"channelName".*?,"day1"',
  'ccchannel_id' => '"channelId":"(.*?)",',
  'ccchannel_name' => '"channelName":"(.*?)",',
  'ccchannel_logo' => '"logo":"(.*?)"',
);
?>
