#登録時のスキップ機能
def skip_confirmation!
  self.confirmed_at = Time.now.utc
end

#更新時のスキップ機能
def skip_reconfirmation!
  @bypass_confirmation_postpone = true
end