<div class="block">
	<h2>{$aLang.talk_filter_title}</h2>

	<div class="block-content">
		<form action="{router page='talk'}" method="GET" name="talk_filter_form">
			<p><label for="talk_filter_sender">{$aLang.talk_filter_label_sender}:</label><br />
			<input type="text" id="talk_filter_sender" name="sender" value="{$_aRequest.sender}" class="input-wide autocomplete-users" style="width:96%" /><br />
			<span class="note">{$aLang.talk_filter_notice_sender}</span></p>

			<p><label for="talk_filter_keyword">{$aLang.talk_filter_label_keyword}:</label><br />
			<input type="text" id="talk_filter_keyword" name="keyword" value="{$_aRequest.keyword}" class="input-wide" style="width:96%" /><br />
			<span class="note">{$aLang.talk_filter_notice_keyword}</span></p>

			<p><label for="talk_filter_start">{$aLang.talk_filter_label_date}:</label><br />
			<input type="text" id="talk_filter_start" name="start" value="{$_aRequest.start}" style="width: 43%" class="date-picker" readonly="readonly" /> &mdash;
			<input type="text" id="talk_filter_end" name="end" value="{$_aRequest.end}" style="width: 44%" class="date-picker" readonly="readonly" /></p>

            <div class="button2" style="float:left; margin-left:0px">
                <em></em><span></span><input type="submit" name="submit_talk_filter" value="{$aLang.talk_filter_submit}" />
            </div>

		</form>
	</div>
</div>