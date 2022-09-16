# encoding: utf-8
# frozen_string_literal: true
#
# Redmine plugin OAuth
#
# Karel Pičman <karel.picman@kontron.com>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

module RedmineOauth

  class Hooks < Redmine::Hook::ViewListener

    def view_account_login_bottom(context = {})
      oauth = Setting.plugin_redmine_oauth['oauth_name']
      if oauth.present? && (oauth != 'none')
        context[:controller].send(:render_to_string, {
          partial: 'hooks/view_account_login_bottom',
          locals: context })
      end
    end

  end

end
