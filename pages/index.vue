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
          class="canvas"
          :side="side"
          :vertical="vertical"
        />

        <EnemyCanvas
          class="canvas"
          :side="side"
          :vertical="vertical"
        />
        <div class="btn-box">
          <div class="flex justify-center">
            <button
              v-longclick="() => moveTop()"
              class="btn-top btn"
              @click="moveTop()"
            >
              上
            </button>
          </div>
          <div class="mt-10px flex justify-center">
            <button
              v-longclick="() => moveLeft()"
              class="btn-left btn"
              @click="moveLeft()"
            >
              左
            </button>
            <button
              v-longclick="() => moveRight()"
              class="btn-right btn"
              @click="moveRight()"
            >
              右
            </button>
          </div>
          <div class="flex justify-center">
            <button
              v-longclick="() => moveBottom()"
              class="btn-bottom btn mt-10px"
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
    MyCanvas
  },
  data() {
    return {
      start: false,
      side: 50,
      vertical: 50,
    }
  },
  mounted() {
    // 画面拡大防止用
    document.body.addEventListener("touchstart", function(e){
      if (e.touches && e.touches.length > 1) {
        e.preventDefault()
      }
    }, {passive: false})
  },
  methods: {
    startGame() {
      this.start = false
    },
    moveRight() {
      this.side = this.side + 5 // 右に5移動する
    },
    moveTop() {
      if (this.vertical > 5) {
        this.vertical = this.vertical - 5 // 上に5移動する
      }
    },
    moveBottom() {
      this.vertical = this.vertical + 5 // 下に5移動する
    },
    moveLeft() {
      if (this.side > 5) {
        this.side = this.side - 5 // 左に5移動する
      }
    }
  }
}
</script>

<style scoped>
.btn-box {
  z-index: 1;
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
.canvas {
  position: absolute;
}
</style>