

	</div><!-- /wrapper -->

    <div class="hFooter"></div>

</div><!-- /container -->

<div id="footer">
	<div class="footer-inner">
        <div class="block1">
            <span>{hook run='copyright'}</span><br />
            Блого-социальный движок<br />
            <a href="/">Информация о проекте</a>
        </div>
        <div class="block4">
        {if $oUserCurrent}
            <h3><a href="{$oUserCurrent->getUserWebPath()}">{$oUserCurrent->getLogin()}</a></h3>
            <a href="{router page='topic'}add/">Создать топик</a><br />
            <a href="{router page='talk'}">Личные сообщения</a><br />
            <a href="{router page='settings'}profile/">Настройки профиля</a><br />
            <a href="{router page='login'}exit/?security_ls_key={$LIVESTREET_SECURITY_KEY}">Выйти</a>
        {else}
            <h3>Авторизация</h3>
            <a href="{router page='login'}">Войти</a><br />
            <a href="{router page='registration'}">Зарегистироваться</a>
        {/if}
        </div>
        <div class="block2">
            <h3>О сайте</h3>
            <a href="/">Контакты</a>
            <a href="/">Пользовательское соглашение</a>
        </div>
        <div class="block3">
            <h3>Подписка</h3>
            <a href="/">RSS</a><br />
            <a href="/">Facebook</a><br />
            <a href="/">Twitter</a><br />
            <a href="/">Вконтакте</a>
        </div>
    </div>
	{hook run='footer_end'}
</div>
{hook run='body_end'}
</body>
</html>