class LessonController < ApplicationController
  # コールバックの設定
  # コールバック名「set_message」
  # privateメソッドset_messageをシンボルでbefore_actionに指定
  # オプションで「onle: :step7」を加えると、step7アクションが呼ばれた場合だけ、事前にアクションコールバックが実行される。
  # 複数のアクションに対して適用する場合はonlyオプションに配列を指定する。(only: [:step7, :step8, :step9])
  # 逆に特定のアクションに対して適用したくない場合は「exceptオプション」を指定する。
  before_action :set_message, only: :step7

  # URLのパラメータを取り出して表示1
  def step1
    render text: "こんにちは、#{params[:name]}さん"
  end

  # URLのパラメータを取り出して表示2
  def step2
    render text: params[:controller] + "#" + params[:action]
  end

  # step4にリダイレクションする
  def step3
    redirect_to action: "step4"  
  end

  def step4
    render text: "step4に移動しました。"
  end

  # リダイレクション実行時のフラッシュ
  def step5
    # リダイレクション実行前にフラッシュに値を記録
    flash[:notice] = "step6に移動します。"
    # step6にリダイレクション
    redirect_to action: "step6"
  end

  def step6
    # リダイレクション元(step5)でフラッシュに記録された内容を取得し表示
    render text: flash[:notice]
  end

  # コールバック
  def step7
    render text: @message
  end

  # テンプレートを使用する際はrenderは不要
  def step8
    @price = (2000 * 1.05).floor
  end

  # テンプレート(step8.html.ebr)を指定してレンダリングすることもできる
  # lessonフォルダ外のテンプレートを使用する場合は「another/show」のようにapp/viewsフォルダを起点としたパスを指定する
  def step9
    @price = 1000
    render "step8"
  end

  def step10
    @comment = "<script>alert('危険！')</script>こんにちは。"
  end

  def step11
    @comment = "<strong>安全なHTML</strong>"
  end

  def step12
    @population = 704414
    @surface = 141.31
  end

  def step13
    @time = Time.now
  end

  def step14
    @population = 127767944
  end

  def step15
    @message = "ごきげんいかかが？\nRailsの勉強をがんばりましょう。"
  end

  def step18
    @zaiko = 10
  end

  def step19
    @items = {"フライパン" => 2680, "ワイングラス" => 2550, "ペッパーミル" => 4515, "ピーラー" => 945}
  end

  # コールバックでしようするprivateメソッド名はコールバック名と同じ名前にする
  private
  def set_message
    @message = "こんにちは"
  end
end
