# -*- coding: utf-8 -*-
require 'spec_helper'

describe "全体テスト" do
  before { Unko.any_instance.stub(:smell).and_return("くさい") } # ここに書くと以降に反映されなかった

  describe "テストA(インスタンス)" do
    before do
      @unko = Unko.create # @unko = create(:unko)
      @unko.stub(:smell).and_return("とてもくさい")
    end
    it { @unko.smell.should == "とてもくさい"  }  # 通った。@unkoをstubしたのでここは納得
  end

  describe "テストB(クラスから一個ずつ取り出す)" do
    # before { Unko.any_instance.stub(:hoge).and_return("unko") } ここに書いたら下のテスト通った
    it do
      Unko.all.each do | unko |
        unko.smell.should == "くさい" # 駄目だった。一番上でstubしてたじゃないの・・・。
      end
    end
  end
end
