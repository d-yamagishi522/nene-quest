<template>
  <div>
    <div v-if="start">
      <TheTitle />
      <div class="text-xl text-center">
        <div
          class="text-black"
          @click="startGame()"
        >
          ひとりであそぶ
        </div>
        <div class="text-gray-600">
          ふたりであそぶ
        </div>
      </div>
    </div>
    <div v-else>
      <div class="example">
        <MyCanvas
          :side="side"
          :vertical="vertical"
        />
        <div class="btn-box">
          <div class="flex justify-center">
            <button
              class="btn-top btn"
              v-longclick="() => moveTop()"
              @click="moveTop()"
            >
              上
            </button>
          </div>
          <div class="mt-10px flex justify-center">
            <button
              class="btn-left btn"
              v-longclick="() => moveLeft()"
              @click="moveLeft()"
            >
              左
            </button>
            <button
              class="btn-right btn"
              v-longclick="() => moveRight()"
              @click="moveRight()"
            >
              右
            </button>
          </div>
          <div class="flex justify-center">
            <button
              class="btn-bottom btn mt-10px"
              v-longclick="() => moveBottom()"
              @click="moveBottom()"
            >
              下
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import TheTitle from '@/components/TheTitle.vue'
import MyCanvas from '@/components/MyCanvas.vue'

export default {
  components: {
    TheTitle,
    MyCanvas,
  },
  data() {
    return {
      start: false,
      side: 50,
      vertical: 50,
    }
  },
  methods: {
    startGame() {
      this.start = false
    },
    moveRight() {
      this.side = this.side + 5 // 右に5移動する
    },
    moveTop() {
      this.vertical = this.vertical - 5 // 上に5移動する
    },
    moveBottom() {
      this.vertical = this.vertical + 5 // 下に5移動する
    },
    moveLeft() {
      this.vertical = this.vertical - 5 // 左に5移動する
    }
  }
}
</script>

<style scoped>
.btn-box {
  position: absolute;
  background-color: brown;
  right: 20px;
  bottom: 20px;
  width: 240px;
  height: 140px;
}
.btn {
  width: 80px;
  height: 40px;
  -webkit-touch-callout:none;
  -webkit-user-select:none;
  background-color: burlywood;
}
.btn-top {

}
.btn-right {
  margin-left: 30px;
}
.mt-10px {
  margin-top: 10px;
}
</style>