<template>
  <div>
    <div v-if="!start">
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
        <div
          v-for="(enemy, index) in enemies"
          :key="index"
        >
          <EnemyCanvas
            class="canvas"
            :side="side"
            :vertical="vertical"
            @stopGame="stopGame()"
          />
        </div>
        <div class="btn-box">
          <div class="flex justify-center">
            <button
              v-longclick="() => moveTop()"
              class="btn-top btn"
              @click="moveTop()"
            />
          </div>
          <div class="mt-10px flex justify-center">
            <button
              v-longclick="() => moveLeft()"
              class="btn-left btn"
              @click="moveLeft()"
            />
            <button
              v-longclick="() => moveRight()"
              class="btn-right btn"
              @click="moveRight()"
            />
          </div>
          <div class="flex justify-center">
            <button
              v-longclick="() => moveBottom()"
              class="btn-bottom btn mt-10px"
              @click="moveBottom()"
            />
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
      enemies: [],
      game: null,
      interval: 1000,
      time: 0
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
      this.start = true
      this.time = performance.now()
      this.score = 0
      this.roop()
    },
    roop() {
      setTimeout(() => {
        const enemy = {
          side: 0,
          vertical: 0
        }
        this.enemies.push(enemy)
        this.interval = 1000 + Math.floor(Math.random() * 9000)
        if (this.start) {
          this.roop()
        }
      }, this.interval)
    },
    stopGame() {
      const end = performance.now()
      if (this.start) {
        this.score = end - this.time
        alert('スコア: ' + Math.floor(this.score / 1000))
        this.start = false
      }
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
  right: 20px;
  bottom: 20px;
  width: 200px;
  height: 140px;
}
.btn {
  border-radius: 5px;
  width: 70px;
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